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

// @volume rule=songsList-length-12,index-order-and-string-properties-hold basis=spec cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem } from '../../../main/ets/model/DataType';
import { songsList } from '../../../main/ets/model/DataSummary';
import { labelByName, resolveLabel } from '../util/LabelResolver';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const SONG_LABEL_NAMES: string[] = ['song_label_01', 'song_label_02', 'song_label_03',
  'song_label_04', 'song_label_05', 'song_label_06'];

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

export default function songsDataMatrix04Test() {
  describe('SongsDataMatrix04', () => {

    /**
     * @tc.number: SUB_MM_DATAPROP01_0100
     * @tc.name: testDataProp010001
     * @tc.desc: Verify list level property of entry 0 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010001 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[0].imageSrc.id > 0));
      expect(songsList[0].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010001 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_0200
     * @tc.name: testDataProp010002
     * @tc.desc: Verify list level property of entry 1 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010002 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[1].imageSrc.id > 0));
      expect(songsList[1].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010002 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_0300
     * @tc.name: testDataProp010003
     * @tc.desc: Verify list level property of entry 2 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010003 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[2].imageSrc.id > 0));
      expect(songsList[2].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010003 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_0400
     * @tc.name: testDataProp010004
     * @tc.desc: Verify list level property of entry 3 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010004 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[3].imageSrc.id > 0));
      expect(songsList[3].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010004 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_0500
     * @tc.name: testDataProp010005
     * @tc.desc: Verify list level property of entry 4 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010005 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[4].imageSrc.id > 0));
      expect(songsList[4].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010005 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_0600
     * @tc.name: testDataProp010006
     * @tc.desc: Verify list level property of entry 5 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010006 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[5].imageSrc.id > 0));
      expect(songsList[5].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010006 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_0700
     * @tc.name: testDataProp010007
     * @tc.desc: Verify list level property of entry 6 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010007 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[6].imageSrc.id > 0));
      expect(songsList[6].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010007 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_0800
     * @tc.name: testDataProp010008
     * @tc.desc: Verify list level property of entry 7 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010008 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[7].imageSrc.id > 0));
      expect(songsList[7].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010008 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_0900
     * @tc.name: testDataProp010009
     * @tc.desc: Verify list level property of entry 8 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010009 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[8].imageSrc.id > 0));
      expect(songsList[8].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010009 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1000
     * @tc.name: testDataProp010010
     * @tc.desc: Verify list level property of entry 9 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010010 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[9].imageSrc.id > 0));
      expect(songsList[9].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010010 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1100
     * @tc.name: testDataProp010011
     * @tc.desc: Verify list level property of entry 10 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010011 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[10].imageSrc.id > 0));
      expect(songsList[10].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010011 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1200
     * @tc.name: testDataProp010012
     * @tc.desc: Verify list level property of entry 11 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010012 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[11].imageSrc.id > 0));
      expect(songsList[11].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010012 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1300
     * @tc.name: testDataProp010013
     * @tc.desc: Verify list level property of entry 0 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010013 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[0].description) !== undefined));
      expect(resolveLabel(songsList[0].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[0].imageSrc.id > 0));
      expect(songsList[0].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010013 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1400
     * @tc.name: testDataProp010014
     * @tc.desc: Verify list level property of entry 1 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010014 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[1].description) !== undefined));
      expect(resolveLabel(songsList[1].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[1].imageSrc.id > 0));
      expect(songsList[1].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010014 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1500
     * @tc.name: testDataProp010015
     * @tc.desc: Verify list level property of entry 2 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010015 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[2].description) !== undefined));
      expect(resolveLabel(songsList[2].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[2].imageSrc.id > 0));
      expect(songsList[2].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010015 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1600
     * @tc.name: testDataProp010016
     * @tc.desc: Verify list level property of entry 3 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010016 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[3].description) !== undefined));
      expect(resolveLabel(songsList[3].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[3].imageSrc.id > 0));
      expect(songsList[3].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010016 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1700
     * @tc.name: testDataProp010017
     * @tc.desc: Verify list level property of entry 4 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010017 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[4].description) !== undefined));
      expect(resolveLabel(songsList[4].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[4].imageSrc.id > 0));
      expect(songsList[4].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010017 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1800
     * @tc.name: testDataProp010018
     * @tc.desc: Verify list level property of entry 5 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010018 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[5].description) !== undefined));
      expect(resolveLabel(songsList[5].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[5].imageSrc.id > 0));
      expect(songsList[5].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010018 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_1900
     * @tc.name: testDataProp010019
     * @tc.desc: Verify list level property of entry 6 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010019 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[6].description) !== undefined));
      expect(resolveLabel(songsList[6].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[6].imageSrc.id > 0));
      expect(songsList[6].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010019 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2000
     * @tc.name: testDataProp010020
     * @tc.desc: Verify list level property of entry 7 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010020 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[7].description) !== undefined));
      expect(resolveLabel(songsList[7].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[7].imageSrc.id > 0));
      expect(songsList[7].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010020 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2100
     * @tc.name: testDataProp010021
     * @tc.desc: Verify list level property of entry 8 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010021 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[8].description) !== undefined));
      expect(resolveLabel(songsList[8].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[8].imageSrc.id > 0));
      expect(songsList[8].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010021 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2200
     * @tc.name: testDataProp010022
     * @tc.desc: Verify list level property of entry 9 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010022 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[9].description) !== undefined));
      expect(resolveLabel(songsList[9].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[9].imageSrc.id > 0));
      expect(songsList[9].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010022 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2300
     * @tc.name: testDataProp010023
     * @tc.desc: Verify list level property of entry 10 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010023 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[10].description) !== undefined));
      expect(resolveLabel(songsList[10].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[10].imageSrc.id > 0));
      expect(songsList[10].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010023 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2400
     * @tc.name: testDataProp010024
     * @tc.desc: Verify list level property of entry 11 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010024 begin');
      hilog.info(DOMAIN, TAG, 'description-present actual=%{public}s expected=true', String(resolveLabel(songsList[11].description) !== undefined));
      expect(resolveLabel(songsList[11].description) !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[11].imageSrc.id > 0));
      expect(songsList[11].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010024 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2500
     * @tc.name: testDataProp010025
     * @tc.desc: Verify list level property of entry 0 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010025 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[0].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[0].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[0].imageSrc.id > 0));
      expect(songsList[0].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010025 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2600
     * @tc.name: testDataProp010026
     * @tc.desc: Verify list level property of entry 1 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010026 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[1].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[1].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[1].imageSrc.id > 0));
      expect(songsList[1].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010026 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2700
     * @tc.name: testDataProp010027
     * @tc.desc: Verify list level property of entry 2 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010027 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[2].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[2].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[2].imageSrc.id > 0));
      expect(songsList[2].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010027 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2800
     * @tc.name: testDataProp010028
     * @tc.desc: Verify list level property of entry 3 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010028 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[3].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[3].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[3].imageSrc.id > 0));
      expect(songsList[3].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010028 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_2900
     * @tc.name: testDataProp010029
     * @tc.desc: Verify list level property of entry 4 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010029 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[4].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[4].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[4].imageSrc.id > 0));
      expect(songsList[4].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010029 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3000
     * @tc.name: testDataProp010030
     * @tc.desc: Verify list level property of entry 5 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010030 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[5].description) as string).length === colonFreeLabel().length));
      expect((resolveLabel(songsList[5].description) as string).length === colonFreeLabel().length).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[5].imageSrc.id > 0));
      expect(songsList[5].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010030 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3100
     * @tc.name: testDataProp010031
     * @tc.desc: Verify list level property of entry 6 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010031 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[6].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[6].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[6].imageSrc.id > 0));
      expect(songsList[6].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010031 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3200
     * @tc.name: testDataProp010032
     * @tc.desc: Verify list level property of entry 7 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010032 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[7].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[7].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[7].imageSrc.id > 0));
      expect(songsList[7].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010032 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3300
     * @tc.name: testDataProp010033
     * @tc.desc: Verify list level property of entry 8 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010033 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[8].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[8].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[8].imageSrc.id > 0));
      expect(songsList[8].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010033 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3400
     * @tc.name: testDataProp010034
     * @tc.desc: Verify list level property of entry 9 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010034 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[9].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[9].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[9].imageSrc.id > 0));
      expect(songsList[9].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010034 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3500
     * @tc.name: testDataProp010035
     * @tc.desc: Verify list level property of entry 10 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010035 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[10].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[10].description) as string).length === colonLabelLength()).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[10].imageSrc.id > 0));
      expect(songsList[10].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010035 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3600
     * @tc.name: testDataProp010036
     * @tc.desc: Verify list level property of entry 11 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010036 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[11].description) as string).length === colonFreeLabel().length));
      expect((resolveLabel(songsList[11].description) as string).length === colonFreeLabel().length).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[11].imageSrc.id > 0));
      expect(songsList[11].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010036 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3700
     * @tc.name: testDataProp010037
     * @tc.desc: Verify list level property of entry 0 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010037 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[0].imageSrc !== undefined));
      expect(songsList[0].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[0].imageSrc.id > 0));
      expect(songsList[0].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010037 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3800
     * @tc.name: testDataProp010038
     * @tc.desc: Verify list level property of entry 1 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010038 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[1].imageSrc !== undefined));
      expect(songsList[1].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[1].imageSrc.id > 0));
      expect(songsList[1].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010038 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_3900
     * @tc.name: testDataProp010039
     * @tc.desc: Verify list level property of entry 2 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010039 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[2].imageSrc !== undefined));
      expect(songsList[2].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[2].imageSrc.id > 0));
      expect(songsList[2].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010039 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4000
     * @tc.name: testDataProp010040
     * @tc.desc: Verify list level property of entry 3 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010040 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[3].imageSrc !== undefined));
      expect(songsList[3].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[3].imageSrc.id > 0));
      expect(songsList[3].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010040 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4100
     * @tc.name: testDataProp010041
     * @tc.desc: Verify list level property of entry 4 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010041 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[4].imageSrc !== undefined));
      expect(songsList[4].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[4].imageSrc.id > 0));
      expect(songsList[4].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010041 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4200
     * @tc.name: testDataProp010042
     * @tc.desc: Verify list level property of entry 5 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010042 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[5].imageSrc !== undefined));
      expect(songsList[5].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[5].imageSrc.id > 0));
      expect(songsList[5].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010042 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4300
     * @tc.name: testDataProp010043
     * @tc.desc: Verify list level property of entry 6 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010043 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[6].imageSrc !== undefined));
      expect(songsList[6].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[6].imageSrc.id > 0));
      expect(songsList[6].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010043 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4400
     * @tc.name: testDataProp010044
     * @tc.desc: Verify list level property of entry 7 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010044 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[7].imageSrc !== undefined));
      expect(songsList[7].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[7].imageSrc.id > 0));
      expect(songsList[7].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010044 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4500
     * @tc.name: testDataProp010045
     * @tc.desc: Verify list level property of entry 8 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010045 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[8].imageSrc !== undefined));
      expect(songsList[8].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[8].imageSrc.id > 0));
      expect(songsList[8].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010045 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4600
     * @tc.name: testDataProp010046
     * @tc.desc: Verify list level property of entry 9 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010046 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[9].imageSrc !== undefined));
      expect(songsList[9].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[9].imageSrc.id > 0));
      expect(songsList[9].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010046 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4700
     * @tc.name: testDataProp010047
     * @tc.desc: Verify list level property of entry 10 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010047 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[10].imageSrc !== undefined));
      expect(songsList[10].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[10].imageSrc.id > 0));
      expect(songsList[10].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010047 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4800
     * @tc.name: testDataProp010048
     * @tc.desc: Verify list level property of entry 11 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010048 begin');
      hilog.info(DOMAIN, TAG, 'image-present actual=%{public}s expected=true', String(songsList[11].imageSrc !== undefined));
      expect(songsList[11].imageSrc !== undefined).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[11].imageSrc.id > 0));
      expect(songsList[11].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010048 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_4900
     * @tc.name: testDataProp010049
     * @tc.desc: Verify list level property of entry 0 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010049 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[0].imageSrc.id > 0));
      expect(songsList[0].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[0].imageSrc.id > 0));
      expect(songsList[0].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010049 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5000
     * @tc.name: testDataProp010050
     * @tc.desc: Verify list level property of entry 1 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010050 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[1].imageSrc.id > 0));
      expect(songsList[1].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[1].imageSrc.id > 0));
      expect(songsList[1].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010050 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5100
     * @tc.name: testDataProp010051
     * @tc.desc: Verify list level property of entry 2 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010051 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[2].imageSrc.id > 0));
      expect(songsList[2].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[2].imageSrc.id > 0));
      expect(songsList[2].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010051 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5200
     * @tc.name: testDataProp010052
     * @tc.desc: Verify list level property of entry 3 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010052 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[3].imageSrc.id > 0));
      expect(songsList[3].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[3].imageSrc.id > 0));
      expect(songsList[3].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010052 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5300
     * @tc.name: testDataProp010053
     * @tc.desc: Verify list level property of entry 4 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010053 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[4].imageSrc.id > 0));
      expect(songsList[4].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[4].imageSrc.id > 0));
      expect(songsList[4].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010053 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5400
     * @tc.name: testDataProp010054
     * @tc.desc: Verify list level property of entry 5 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010054 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[5].imageSrc.id > 0));
      expect(songsList[5].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[5].imageSrc.id > 0));
      expect(songsList[5].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010054 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5500
     * @tc.name: testDataProp010055
     * @tc.desc: Verify list level property of entry 6 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010055 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[6].imageSrc.id > 0));
      expect(songsList[6].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[6].imageSrc.id > 0));
      expect(songsList[6].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010055 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5600
     * @tc.name: testDataProp010056
     * @tc.desc: Verify list level property of entry 7 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010056 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[7].imageSrc.id > 0));
      expect(songsList[7].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[7].imageSrc.id > 0));
      expect(songsList[7].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010056 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5700
     * @tc.name: testDataProp010057
     * @tc.desc: Verify list level property of entry 8 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010057 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[8].imageSrc.id > 0));
      expect(songsList[8].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[8].imageSrc.id > 0));
      expect(songsList[8].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010057 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5800
     * @tc.name: testDataProp010058
     * @tc.desc: Verify list level property of entry 9 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010058 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[9].imageSrc.id > 0));
      expect(songsList[9].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[9].imageSrc.id > 0));
      expect(songsList[9].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010058 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_5900
     * @tc.name: testDataProp010059
     * @tc.desc: Verify list level property of entry 10 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010059 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[10].imageSrc.id > 0));
      expect(songsList[10].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[10].imageSrc.id > 0));
      expect(songsList[10].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010059 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6000
     * @tc.name: testDataProp010060
     * @tc.desc: Verify list level property of entry 11 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010060 begin');
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[11].imageSrc.id > 0));
      expect(songsList[11].imageSrc.id > 0).assertTrue();
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-check actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[11].imageSrc.id > 0));
      expect(songsList[11].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010060 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6100
     * @tc.name: testDataProp010061
     * @tc.desc: Verify list level property of entry 0 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010061 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[0].imageSrc.id > 0));
      expect(songsList[0].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010061 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6200
     * @tc.name: testDataProp010062
     * @tc.desc: Verify list level property of entry 1 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010062 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[1].imageSrc.id > 0));
      expect(songsList[1].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010062 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6300
     * @tc.name: testDataProp010063
     * @tc.desc: Verify list level property of entry 2 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010063 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[2].imageSrc.id > 0));
      expect(songsList[2].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010063 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6400
     * @tc.name: testDataProp010064
     * @tc.desc: Verify list level property of entry 3 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010064 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[3].imageSrc.id > 0));
      expect(songsList[3].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010064 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6500
     * @tc.name: testDataProp010065
     * @tc.desc: Verify list level property of entry 4 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010065 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[4].imageSrc.id > 0));
      expect(songsList[4].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010065 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6600
     * @tc.name: testDataProp010066
     * @tc.desc: Verify list level property of entry 5 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010066 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[5].imageSrc.id > 0));
      expect(songsList[5].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010066 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6700
     * @tc.name: testDataProp010067
     * @tc.desc: Verify list level property of entry 6 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010067 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[6].imageSrc.id > 0));
      expect(songsList[6].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010067 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6800
     * @tc.name: testDataProp010068
     * @tc.desc: Verify list level property of entry 7 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010068 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[7].imageSrc.id > 0));
      expect(songsList[7].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010068 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_6900
     * @tc.name: testDataProp010069
     * @tc.desc: Verify list level property of entry 8 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010069 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[8].imageSrc.id > 0));
      expect(songsList[8].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010069 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_7000
     * @tc.name: testDataProp010070
     * @tc.desc: Verify list level property of entry 9 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010070 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[9].imageSrc.id > 0));
      expect(songsList[9].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010070 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_7100
     * @tc.name: testDataProp010071
     * @tc.desc: Verify list level property of entry 10 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010071 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[10].imageSrc.id > 0));
      expect(songsList[10].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010071 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_7200
     * @tc.name: testDataProp010072
     * @tc.desc: Verify list level property of entry 11 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataProp010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010072 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length-again actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'image-id-positive actual=%{public}s expected=true', String(songsList[11].imageSrc.id > 0));
      expect(songsList[11].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010072 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_7300
     * @tc.name: testDataProp010073
     * @tc.desc: Anchor: songsList index range must be exactly 0..11
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataProp010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010073 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = songsList[11].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'last-media actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, 'last-index actual=%{public}s expected=true', String(songsList.length - 1 === 11));
      expect(songsList.length - 1 === 11).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010073 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_7400
     * @tc.name: testDataProp010074
     * @tc.desc: Anchor: songsList must not contain an entry with empty description
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataProp010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010074 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).length === 0).length;
      hilog.info(DOMAIN, TAG, 'empty-description-count actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).trim() !== resolveLabel(item.description)).length;
      hilog.info(DOMAIN, TAG, 'padded-description-count actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      const v2: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v2), String(12));
      expect(v2).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010074 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPROP01_7500
     * @tc.name: testDataProp010075
     * @tc.desc: Anchor: songsList entries must expose both media and text
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataProp010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010075 begin');
      const v0: number = songsList.filter((item: IconItem) => item.imageSrc.id > 0).length;
      hilog.info(DOMAIN, TAG, 'media-present-count actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).length > 0).length;
      hilog.info(DOMAIN, TAG, 'text-present-count actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      const v2: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string) === '').length;
      hilog.info(DOMAIN, TAG, 'blank-text-count actual=%{public}s expected=%{public}s', String(v2), String(0));
      expect(v2).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataProp010075 end');
    })

  })
}
