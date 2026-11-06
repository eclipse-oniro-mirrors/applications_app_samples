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
import { describe, beforeEach, it, expect } from '@ohos/hypium';
import DateTimeUtil from '../../../main/ets/utils/DateTimeUtil';
import { paceTurn } from './TestPace';

export default function concatDateTableTest() {
  describe('concatDateTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_0100
     * @tc.name testConcatDateTable0001
     * @tc.desc Verify concatDate joins 2000, 1 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0001', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 1, 9);
      expect(text).assertEqual('200019');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('19')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_0200
     * @tc.name testConcatDateTable0002
     * @tc.desc Verify concatDate joins 2000, 1 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0002', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 1, 28);
      expect(text).assertEqual('2000128');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('128')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_0300
     * @tc.name testConcatDateTable0003
     * @tc.desc Verify concatDate joins 2000, 2 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0003', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 2, 10);
      expect(text).assertEqual('2000210');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('210')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_0400
     * @tc.name testConcatDateTable0004
     * @tc.desc Verify concatDate joins 2000, 2 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0004', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 2, 30);
      expect(text).assertEqual('2000230');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('230')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_0500
     * @tc.name testConcatDateTable0005
     * @tc.desc Verify concatDate joins 2000, 3 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0005', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 3, 28);
      expect(text).assertEqual('2000328');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('328')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_0600
     * @tc.name testConcatDateTable0006
     * @tc.desc Verify concatDate joins 2000, 3 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0006', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 3, 31);
      expect(text).assertEqual('2000331');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('331')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_0700
     * @tc.name testConcatDateTable0007
     * @tc.desc Verify concatDate joins 2000, 4 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0007', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 4, 30);
      expect(text).assertEqual('2000430');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('430')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_0800
     * @tc.name testConcatDateTable0008
     * @tc.desc Verify concatDate joins 2000, 4 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0008', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 4, 1);
      expect(text).assertEqual('200041');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('41')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_0900
     * @tc.name testConcatDateTable0009
     * @tc.desc Verify concatDate joins 2000, 5 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0009', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 5, 31);
      expect(text).assertEqual('2000531');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('531')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1000
     * @tc.name testConcatDateTable0010
     * @tc.desc Verify concatDate joins 2000, 5 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0010', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 5, 9);
      expect(text).assertEqual('200059');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('59')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1100
     * @tc.name testConcatDateTable0011
     * @tc.desc Verify concatDate joins 2000, 6 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0011', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 6, 1);
      expect(text).assertEqual('200061');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('61')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1200
     * @tc.name testConcatDateTable0012
     * @tc.desc Verify concatDate joins 2000, 6 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0012', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 6, 10);
      expect(text).assertEqual('2000610');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('610')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1300
     * @tc.name testConcatDateTable0013
     * @tc.desc Verify concatDate joins 2000, 7 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0013', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 7, 9);
      expect(text).assertEqual('200079');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('79')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1400
     * @tc.name testConcatDateTable0014
     * @tc.desc Verify concatDate joins 2000, 7 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0014', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 7, 28);
      expect(text).assertEqual('2000728');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('728')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1500
     * @tc.name testConcatDateTable0015
     * @tc.desc Verify concatDate joins 2000, 8 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0015', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 8, 10);
      expect(text).assertEqual('2000810');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('810')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1600
     * @tc.name testConcatDateTable0016
     * @tc.desc Verify concatDate joins 2000, 8 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0016', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 8, 30);
      expect(text).assertEqual('2000830');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('830')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1700
     * @tc.name testConcatDateTable0017
     * @tc.desc Verify concatDate joins 2000, 9 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0017', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 9, 28);
      expect(text).assertEqual('2000928');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('928')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1800
     * @tc.name testConcatDateTable0018
     * @tc.desc Verify concatDate joins 2000, 9 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0018', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 9, 31);
      expect(text).assertEqual('2000931');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('931')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_1900
     * @tc.name testConcatDateTable0019
     * @tc.desc Verify concatDate joins 2000, 10 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0019', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 10, 30);
      expect(text).assertEqual('20001030');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('1030')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2000
     * @tc.name testConcatDateTable0020
     * @tc.desc Verify concatDate joins 2000, 10 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0020', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 10, 1);
      expect(text).assertEqual('2000101');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('101')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2100
     * @tc.name testConcatDateTable0021
     * @tc.desc Verify concatDate joins 2000, 11 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0021', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 11, 31);
      expect(text).assertEqual('20001131');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('1131')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2200
     * @tc.name testConcatDateTable0022
     * @tc.desc Verify concatDate joins 2000, 11 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0022', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 11, 9);
      expect(text).assertEqual('2000119');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('119')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2300
     * @tc.name testConcatDateTable0023
     * @tc.desc Verify concatDate joins 2000, 12 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0023', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 12, 1);
      expect(text).assertEqual('2000121');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('121')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2400
     * @tc.name testConcatDateTable0024
     * @tc.desc Verify concatDate joins 2000, 12 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0024', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2000, 12, 10);
      expect(text).assertEqual('20001210');
      expect(text.startsWith('2000')).assertTrue();
      expect(text.endsWith('1210')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2500
     * @tc.name testConcatDateTable0025
     * @tc.desc Verify concatDate joins 2024, 1 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0025', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 1, 10);
      expect(text).assertEqual('2024110');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('110')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2600
     * @tc.name testConcatDateTable0026
     * @tc.desc Verify concatDate joins 2024, 1 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0026', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 1, 30);
      expect(text).assertEqual('2024130');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('130')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2700
     * @tc.name testConcatDateTable0027
     * @tc.desc Verify concatDate joins 2024, 2 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0027', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 2, 28);
      expect(text).assertEqual('2024228');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('228')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2800
     * @tc.name testConcatDateTable0028
     * @tc.desc Verify concatDate joins 2024, 2 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0028', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 2, 31);
      expect(text).assertEqual('2024231');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('231')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_2900
     * @tc.name testConcatDateTable0029
     * @tc.desc Verify concatDate joins 2024, 3 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0029', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 3, 30);
      expect(text).assertEqual('2024330');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('330')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3000
     * @tc.name testConcatDateTable0030
     * @tc.desc Verify concatDate joins 2024, 3 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0030', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 3, 1);
      expect(text).assertEqual('202431');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('31')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3100
     * @tc.name testConcatDateTable0031
     * @tc.desc Verify concatDate joins 2024, 4 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0031', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 4, 31);
      expect(text).assertEqual('2024431');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('431')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3200
     * @tc.name testConcatDateTable0032
     * @tc.desc Verify concatDate joins 2024, 4 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0032', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 4, 9);
      expect(text).assertEqual('202449');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('49')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3300
     * @tc.name testConcatDateTable0033
     * @tc.desc Verify concatDate joins 2024, 5 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0033', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 5, 1);
      expect(text).assertEqual('202451');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('51')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3400
     * @tc.name testConcatDateTable0034
     * @tc.desc Verify concatDate joins 2024, 5 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0034', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 5, 10);
      expect(text).assertEqual('2024510');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('510')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3500
     * @tc.name testConcatDateTable0035
     * @tc.desc Verify concatDate joins 2024, 6 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0035', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 6, 9);
      expect(text).assertEqual('202469');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('69')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3600
     * @tc.name testConcatDateTable0036
     * @tc.desc Verify concatDate joins 2024, 6 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0036', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 6, 28);
      expect(text).assertEqual('2024628');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('628')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3700
     * @tc.name testConcatDateTable0037
     * @tc.desc Verify concatDate joins 2024, 7 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0037', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 7, 10);
      expect(text).assertEqual('2024710');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('710')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3800
     * @tc.name testConcatDateTable0038
     * @tc.desc Verify concatDate joins 2024, 7 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0038', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 7, 30);
      expect(text).assertEqual('2024730');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('730')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_3900
     * @tc.name testConcatDateTable0039
     * @tc.desc Verify concatDate joins 2024, 8 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0039', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 8, 28);
      expect(text).assertEqual('2024828');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('828')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4000
     * @tc.name testConcatDateTable0040
     * @tc.desc Verify concatDate joins 2024, 8 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0040', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 8, 31);
      expect(text).assertEqual('2024831');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('831')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4100
     * @tc.name testConcatDateTable0041
     * @tc.desc Verify concatDate joins 2024, 9 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0041', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 9, 30);
      expect(text).assertEqual('2024930');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('930')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4200
     * @tc.name testConcatDateTable0042
     * @tc.desc Verify concatDate joins 2024, 9 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0042', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 9, 1);
      expect(text).assertEqual('202491');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('91')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4300
     * @tc.name testConcatDateTable0043
     * @tc.desc Verify concatDate joins 2024, 10 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0043', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 10, 31);
      expect(text).assertEqual('20241031');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('1031')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4400
     * @tc.name testConcatDateTable0044
     * @tc.desc Verify concatDate joins 2024, 10 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0044', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 10, 9);
      expect(text).assertEqual('2024109');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('109')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4500
     * @tc.name testConcatDateTable0045
     * @tc.desc Verify concatDate joins 2024, 11 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0045', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 11, 1);
      expect(text).assertEqual('2024111');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('111')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4600
     * @tc.name testConcatDateTable0046
     * @tc.desc Verify concatDate joins 2024, 11 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0046', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 11, 10);
      expect(text).assertEqual('20241110');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('1110')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4700
     * @tc.name testConcatDateTable0047
     * @tc.desc Verify concatDate joins 2024, 12 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0047', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 12, 9);
      expect(text).assertEqual('2024129');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('129')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4800
     * @tc.name testConcatDateTable0048
     * @tc.desc Verify concatDate joins 2024, 12 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0048', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2024, 12, 28);
      expect(text).assertEqual('20241228');
      expect(text.startsWith('2024')).assertTrue();
      expect(text.endsWith('1228')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_4900
     * @tc.name testConcatDateTable0049
     * @tc.desc Verify concatDate joins 2026, 1 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0049', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 1, 28);
      expect(text).assertEqual('2026128');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('128')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5000
     * @tc.name testConcatDateTable0050
     * @tc.desc Verify concatDate joins 2026, 1 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0050', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 1, 31);
      expect(text).assertEqual('2026131');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('131')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5100
     * @tc.name testConcatDateTable0051
     * @tc.desc Verify concatDate joins 2026, 2 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0051', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 2, 30);
      expect(text).assertEqual('2026230');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('230')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5200
     * @tc.name testConcatDateTable0052
     * @tc.desc Verify concatDate joins 2026, 2 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0052', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 2, 1);
      expect(text).assertEqual('202621');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('21')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5300
     * @tc.name testConcatDateTable0053
     * @tc.desc Verify concatDate joins 2026, 3 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0053', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 3, 31);
      expect(text).assertEqual('2026331');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('331')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5400
     * @tc.name testConcatDateTable0054
     * @tc.desc Verify concatDate joins 2026, 3 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0054', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 3, 9);
      expect(text).assertEqual('202639');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('39')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5500
     * @tc.name testConcatDateTable0055
     * @tc.desc Verify concatDate joins 2026, 4 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0055', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 4, 1);
      expect(text).assertEqual('202641');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('41')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5600
     * @tc.name testConcatDateTable0056
     * @tc.desc Verify concatDate joins 2026, 4 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0056', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 4, 10);
      expect(text).assertEqual('2026410');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('410')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5700
     * @tc.name testConcatDateTable0057
     * @tc.desc Verify concatDate joins 2026, 5 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0057', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 5, 9);
      expect(text).assertEqual('202659');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('59')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5800
     * @tc.name testConcatDateTable0058
     * @tc.desc Verify concatDate joins 2026, 5 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0058', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 5, 28);
      expect(text).assertEqual('2026528');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('528')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_5900
     * @tc.name testConcatDateTable0059
     * @tc.desc Verify concatDate joins 2026, 6 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0059', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 6, 10);
      expect(text).assertEqual('2026610');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('610')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6000
     * @tc.name testConcatDateTable0060
     * @tc.desc Verify concatDate joins 2026, 6 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0060', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 6, 30);
      expect(text).assertEqual('2026630');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('630')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6100
     * @tc.name testConcatDateTable0061
     * @tc.desc Verify concatDate joins 2026, 7 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0061', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 7, 28);
      expect(text).assertEqual('2026728');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('728')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6200
     * @tc.name testConcatDateTable0062
     * @tc.desc Verify concatDate joins 2026, 7 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0062', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 7, 31);
      expect(text).assertEqual('2026731');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('731')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6300
     * @tc.name testConcatDateTable0063
     * @tc.desc Verify concatDate joins 2026, 8 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0063', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 8, 30);
      expect(text).assertEqual('2026830');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('830')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6400
     * @tc.name testConcatDateTable0064
     * @tc.desc Verify concatDate joins 2026, 8 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0064', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 8, 1);
      expect(text).assertEqual('202681');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('81')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6500
     * @tc.name testConcatDateTable0065
     * @tc.desc Verify concatDate joins 2026, 9 and 31 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0065', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 9, 31);
      expect(text).assertEqual('2026931');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('931')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6600
     * @tc.name testConcatDateTable0066
     * @tc.desc Verify concatDate joins 2026, 9 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0066', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 9, 9);
      expect(text).assertEqual('202699');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('99')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6700
     * @tc.name testConcatDateTable0067
     * @tc.desc Verify concatDate joins 2026, 10 and 1 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0067', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 10, 1);
      expect(text).assertEqual('2026101');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('101')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6800
     * @tc.name testConcatDateTable0068
     * @tc.desc Verify concatDate joins 2026, 10 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0068', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 10, 10);
      expect(text).assertEqual('20261010');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('1010')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_6900
     * @tc.name testConcatDateTable0069
     * @tc.desc Verify concatDate joins 2026, 11 and 9 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0069', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 11, 9);
      expect(text).assertEqual('2026119');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('119')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_7000
     * @tc.name testConcatDateTable0070
     * @tc.desc Verify concatDate joins 2026, 11 and 28 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0070', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 11, 28);
      expect(text).assertEqual('20261128');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('1128')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_7100
     * @tc.name testConcatDateTable0071
     * @tc.desc Verify concatDate joins 2026, 12 and 10 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0071', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 12, 10);
      expect(text).assertEqual('20261210');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('1210')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CDATE_7200
     * @tc.name testConcatDateTable0072
     * @tc.desc Verify concatDate joins 2026, 12 and 30 without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcatDateTable0072', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatDate(2026, 12, 30);
      expect(text).assertEqual('20261230');
      expect(text.startsWith('2026')).assertTrue();
      expect(text.endsWith('1230')).assertTrue();
    })
  })
}
