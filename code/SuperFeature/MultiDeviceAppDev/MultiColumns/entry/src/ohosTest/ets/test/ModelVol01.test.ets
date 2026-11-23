/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

// @volume rule=Model data types (MailType/photoType/OperateTabs) frozen instances
// -> constructor stores exact fields basis=main-frozen cases=75
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { OperateTabs, MailType, photoType } from '../../../main/ets/model/DataType';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_MDL1]';

function makeRes(id: number): Resource {
  return {
    id: id,
    type: 10001,
    bundleName: 'com.samples.multicolumns',
    moduleName: 'entry',
    params: [] as Array<string | number>
  };
}

export default function modelVol01Test() {
  describe('MultiColumnsModelVol01', () => {

    /**
     * @tc.name   testModelVol1025
     * @tc.number SUB_MC_MDL_1025
     * @tc.desc   Anchor: MailType stores zero num and low resource ids verbatim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1025 begin');
      const m: MailType = new MailType(makeRes(0), 0, makeRes(1));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(0));
      expect(m.num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1025 end');
    });

    /**
     * @tc.name   testModelVol1026
     * @tc.number SUB_MC_MDL_1026
     * @tc.desc   MailType(type id 101, num 4, src id 501) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1026 begin');
      const m: MailType = new MailType(makeRes(101), 4, makeRes(501));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(4));
      expect(m.num).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(501);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1026 end');
    });

    /**
     * @tc.name   testModelVol1027
     * @tc.number SUB_MC_MDL_1027
     * @tc.desc   MailType(type id 102, num 7, src id 502) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1027 begin');
      const m: MailType = new MailType(makeRes(102), 7, makeRes(502));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(7));
      expect(m.num).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(502);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1027 end');
    });

    /**
     * @tc.name   testModelVol1028
     * @tc.number SUB_MC_MDL_1028
     * @tc.desc   MailType(type id 103, num 10, src id 503) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1028 begin');
      const m: MailType = new MailType(makeRes(103), 10, makeRes(503));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(10));
      expect(m.num).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(503);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1028 end');
    });

    /**
     * @tc.name   testModelVol1029
     * @tc.number SUB_MC_MDL_1029
     * @tc.desc   MailType(type id 104, num 13, src id 504) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1029 begin');
      const m: MailType = new MailType(makeRes(104), 13, makeRes(504));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(13));
      expect(m.num).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(504);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1029 end');
    });

    /**
     * @tc.name   testModelVol1030
     * @tc.number SUB_MC_MDL_1030
     * @tc.desc   MailType(type id 105, num 16, src id 505) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1030 begin');
      const m: MailType = new MailType(makeRes(105), 16, makeRes(505));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(16));
      expect(m.num).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(505);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1030 end');
    });

    /**
     * @tc.name   testModelVol1031
     * @tc.number SUB_MC_MDL_1031
     * @tc.desc   MailType(type id 106, num 19, src id 506) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1031 begin');
      const m: MailType = new MailType(makeRes(106), 19, makeRes(506));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(19));
      expect(m.num).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(506);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1031 end');
    });

    /**
     * @tc.name   testModelVol1032
     * @tc.number SUB_MC_MDL_1032
     * @tc.desc   MailType(type id 107, num 22, src id 507) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1032 begin');
      const m: MailType = new MailType(makeRes(107), 22, makeRes(507));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(22));
      expect(m.num).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(507);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1032 end');
    });

    /**
     * @tc.name   testModelVol1033
     * @tc.number SUB_MC_MDL_1033
     * @tc.desc   MailType(type id 108, num 25, src id 508) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1033 begin');
      const m: MailType = new MailType(makeRes(108), 25, makeRes(508));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(25));
      expect(m.num).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(508);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1033 end');
    });

    /**
     * @tc.name   testModelVol1034
     * @tc.number SUB_MC_MDL_1034
     * @tc.desc   MailType(type id 109, num 28, src id 509) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1034 begin');
      const m: MailType = new MailType(makeRes(109), 28, makeRes(509));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(28));
      expect(m.num).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(509);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1034 end');
    });

    /**
     * @tc.name   testModelVol1035
     * @tc.number SUB_MC_MDL_1035
     * @tc.desc   MailType(type id 110, num 31, src id 510) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1035 begin');
      const m: MailType = new MailType(makeRes(110), 31, makeRes(510));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(31));
      expect(m.num).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(510);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1035 end');
    });

    /**
     * @tc.name   testModelVol1036
     * @tc.number SUB_MC_MDL_1036
     * @tc.desc   MailType(type id 111, num 34, src id 511) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1036 begin');
      const m: MailType = new MailType(makeRes(111), 34, makeRes(511));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(34));
      expect(m.num).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(511);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1036 end');
    });

    /**
     * @tc.name   testModelVol1037
     * @tc.number SUB_MC_MDL_1037
     * @tc.desc   MailType(type id 112, num 37, src id 512) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1037 begin');
      const m: MailType = new MailType(makeRes(112), 37, makeRes(512));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(37));
      expect(m.num).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1037 end');
    });

    /**
     * @tc.name   testModelVol1038
     * @tc.number SUB_MC_MDL_1038
     * @tc.desc   MailType(type id 113, num 40, src id 513) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1038 begin');
      const m: MailType = new MailType(makeRes(113), 40, makeRes(513));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(40));
      expect(m.num).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(513);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1038 end');
    });

    /**
     * @tc.name   testModelVol1039
     * @tc.number SUB_MC_MDL_1039
     * @tc.desc   MailType(type id 114, num 43, src id 514) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1039 begin');
      const m: MailType = new MailType(makeRes(114), 43, makeRes(514));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(43));
      expect(m.num).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(514);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1039 end');
    });

    /**
     * @tc.name   testModelVol1040
     * @tc.number SUB_MC_MDL_1040
     * @tc.desc   MailType(type id 115, num 46, src id 515) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1040 begin');
      const m: MailType = new MailType(makeRes(115), 46, makeRes(515));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(46));
      expect(m.num).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(515);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1040 end');
    });

    /**
     * @tc.name   testModelVol1041
     * @tc.number SUB_MC_MDL_1041
     * @tc.desc   MailType(type id 116, num 49, src id 516) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1041 begin');
      const m: MailType = new MailType(makeRes(116), 49, makeRes(516));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(49));
      expect(m.num).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(516);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1041 end');
    });

    /**
     * @tc.name   testModelVol1042
     * @tc.number SUB_MC_MDL_1042
     * @tc.desc   MailType(type id 117, num 52, src id 517) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1042 begin');
      const m: MailType = new MailType(makeRes(117), 52, makeRes(517));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(52));
      expect(m.num).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(517);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1042 end');
    });

    /**
     * @tc.name   testModelVol1043
     * @tc.number SUB_MC_MDL_1043
     * @tc.desc   MailType(type id 118, num 55, src id 518) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1043 begin');
      const m: MailType = new MailType(makeRes(118), 55, makeRes(518));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(55));
      expect(m.num).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(518);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1043 end');
    });

    /**
     * @tc.name   testModelVol1044
     * @tc.number SUB_MC_MDL_1044
     * @tc.desc   MailType(type id 119, num 58, src id 519) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1044 begin');
      const m: MailType = new MailType(makeRes(119), 58, makeRes(519));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(58));
      expect(m.num).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(519);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1044 end');
    });

    /**
     * @tc.name   testModelVol1045
     * @tc.number SUB_MC_MDL_1045
     * @tc.desc   MailType(type id 120, num 61, src id 520) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1045 begin');
      const m: MailType = new MailType(makeRes(120), 61, makeRes(520));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(61));
      expect(m.num).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(520);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1045 end');
    });

    /**
     * @tc.name   testModelVol1046
     * @tc.number SUB_MC_MDL_1046
     * @tc.desc   MailType(type id 121, num 64, src id 521) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1046 begin');
      const m: MailType = new MailType(makeRes(121), 64, makeRes(521));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(64));
      expect(m.num).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(521);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1046 end');
    });

    /**
     * @tc.name   testModelVol1047
     * @tc.number SUB_MC_MDL_1047
     * @tc.desc   MailType(type id 122, num 67, src id 522) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1047 begin');
      const m: MailType = new MailType(makeRes(122), 67, makeRes(522));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(67));
      expect(m.num).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(122);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(522);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1047 end');
    });

    /**
     * @tc.name   testModelVol1048
     * @tc.number SUB_MC_MDL_1048
     * @tc.desc   MailType(type id 123, num 70, src id 523) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1048 begin');
      const m: MailType = new MailType(makeRes(123), 70, makeRes(523));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(70));
      expect(m.num).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(523);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1048 end');
    });

    /**
     * @tc.name   testModelVol1049
     * @tc.number SUB_MC_MDL_1049
     * @tc.desc   MailType(type id 124, num 73, src id 524) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1049 begin');
      const m: MailType = new MailType(makeRes(124), 73, makeRes(524));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(73));
      expect(m.num).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(524);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1049 end');
    });

    /**
     * @tc.name   testModelVol1050
     * @tc.number SUB_MC_MDL_1050
     * @tc.desc   MailType(type id 125, num 76, src id 525) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1050 begin');
      const m: MailType = new MailType(makeRes(125), 76, makeRes(525));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(76));
      expect(m.num).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(125);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(525);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1050 end');
    });

    /**
     * @tc.name   testModelVol1051
     * @tc.number SUB_MC_MDL_1051
     * @tc.desc   MailType(type id 126, num 79, src id 526) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1051 begin');
      const m: MailType = new MailType(makeRes(126), 79, makeRes(526));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(79));
      expect(m.num).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(526);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1051 end');
    });

    /**
     * @tc.name   testModelVol1052
     * @tc.number SUB_MC_MDL_1052
     * @tc.desc   MailType(type id 127, num 82, src id 527) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1052 begin');
      const m: MailType = new MailType(makeRes(127), 82, makeRes(527));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(82));
      expect(m.num).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(527);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1052 end');
    });

    /**
     * @tc.name   testModelVol1053
     * @tc.number SUB_MC_MDL_1053
     * @tc.desc   MailType(type id 128, num 85, src id 528) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1053 begin');
      const m: MailType = new MailType(makeRes(128), 85, makeRes(528));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(85));
      expect(m.num).assertEqual(85);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(528);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1053 end');
    });

    /**
     * @tc.name   testModelVol1054
     * @tc.number SUB_MC_MDL_1054
     * @tc.desc   MailType(type id 129, num 88, src id 529) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1054 begin');
      const m: MailType = new MailType(makeRes(129), 88, makeRes(529));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(88));
      expect(m.num).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(529);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1054 end');
    });

    /**
     * @tc.name   testModelVol1055
     * @tc.number SUB_MC_MDL_1055
     * @tc.desc   MailType(type id 130, num 91, src id 530) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1055 begin');
      const m: MailType = new MailType(makeRes(130), 91, makeRes(530));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(91));
      expect(m.num).assertEqual(91);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(530);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1055 end');
    });

    /**
     * @tc.name   testModelVol1056
     * @tc.number SUB_MC_MDL_1056
     * @tc.desc   MailType(type id 131, num 94, src id 531) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1056 begin');
      const m: MailType = new MailType(makeRes(131), 94, makeRes(531));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(94));
      expect(m.num).assertEqual(94);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(131);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(531);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1056 end');
    });

    /**
     * @tc.name   testModelVol1057
     * @tc.number SUB_MC_MDL_1057
     * @tc.desc   MailType(type id 132, num 97, src id 532) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1057 begin');
      const m: MailType = new MailType(makeRes(132), 97, makeRes(532));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(97));
      expect(m.num).assertEqual(97);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(532);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1057 end');
    });

    /**
     * @tc.name   testModelVol1058
     * @tc.number SUB_MC_MDL_1058
     * @tc.desc   MailType(type id 133, num 100, src id 533) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1058 begin');
      const m: MailType = new MailType(makeRes(133), 100, makeRes(533));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(100));
      expect(m.num).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(533);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1058 end');
    });

    /**
     * @tc.name   testModelVol1059
     * @tc.number SUB_MC_MDL_1059
     * @tc.desc   MailType(type id 134, num 103, src id 534) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1059 begin');
      const m: MailType = new MailType(makeRes(134), 103, makeRes(534));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(103));
      expect(m.num).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(534);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1059 end');
    });

    /**
     * @tc.name   testModelVol1060
     * @tc.number SUB_MC_MDL_1060
     * @tc.desc   MailType(type id 135, num 106, src id 535) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1060 begin');
      const m: MailType = new MailType(makeRes(135), 106, makeRes(535));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(106));
      expect(m.num).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(535);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1060 end');
    });

    /**
     * @tc.name   testModelVol1061
     * @tc.number SUB_MC_MDL_1061
     * @tc.desc   MailType(type id 136, num 109, src id 536) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1061 begin');
      const m: MailType = new MailType(makeRes(136), 109, makeRes(536));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(109));
      expect(m.num).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(536);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1061 end');
    });

    /**
     * @tc.name   testModelVol1062
     * @tc.number SUB_MC_MDL_1062
     * @tc.desc   MailType(type id 137, num 112, src id 537) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1062 begin');
      const m: MailType = new MailType(makeRes(137), 112, makeRes(537));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(112));
      expect(m.num).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(137);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(537);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1062 end');
    });

    /**
     * @tc.name   testModelVol1063
     * @tc.number SUB_MC_MDL_1063
     * @tc.desc   MailType(type id 138, num 115, src id 538) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1063 begin');
      const m: MailType = new MailType(makeRes(138), 115, makeRes(538));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(115));
      expect(m.num).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(138);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(538);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1063 end');
    });

    /**
     * @tc.name   testModelVol1064
     * @tc.number SUB_MC_MDL_1064
     * @tc.desc   MailType(type id 139, num 118, src id 539) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1064 begin');
      const m: MailType = new MailType(makeRes(139), 118, makeRes(539));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(118));
      expect(m.num).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(139);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(539);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1064 end');
    });

    /**
     * @tc.name   testModelVol1065
     * @tc.number SUB_MC_MDL_1065
     * @tc.desc   MailType(type id 140, num 121, src id 540) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1065 begin');
      const m: MailType = new MailType(makeRes(140), 121, makeRes(540));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(121));
      expect(m.num).assertEqual(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(540);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1065 end');
    });

    /**
     * @tc.name   testModelVol1066
     * @tc.number SUB_MC_MDL_1066
     * @tc.desc   MailType(type id 141, num 124, src id 541) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1066 begin');
      const m: MailType = new MailType(makeRes(141), 124, makeRes(541));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(124));
      expect(m.num).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(541);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1066 end');
    });

    /**
     * @tc.name   testModelVol1067
     * @tc.number SUB_MC_MDL_1067
     * @tc.desc   MailType(type id 142, num 127, src id 542) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1067 begin');
      const m: MailType = new MailType(makeRes(142), 127, makeRes(542));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(127));
      expect(m.num).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(142);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(542);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1067 end');
    });

    /**
     * @tc.name   testModelVol1068
     * @tc.number SUB_MC_MDL_1068
     * @tc.desc   MailType(type id 143, num 130, src id 543) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1068 begin');
      const m: MailType = new MailType(makeRes(143), 130, makeRes(543));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(130));
      expect(m.num).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(143);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(543);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1068 end');
    });

    /**
     * @tc.name   testModelVol1069
     * @tc.number SUB_MC_MDL_1069
     * @tc.desc   MailType(type id 144, num 133, src id 544) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1069 begin');
      const m: MailType = new MailType(makeRes(144), 133, makeRes(544));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(133));
      expect(m.num).assertEqual(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(544);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1069 end');
    });

    /**
     * @tc.name   testModelVol1070
     * @tc.number SUB_MC_MDL_1070
     * @tc.desc   MailType(type id 145, num 136, src id 545) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1070 begin');
      const m: MailType = new MailType(makeRes(145), 136, makeRes(545));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(136));
      expect(m.num).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(545);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1070 end');
    });

    /**
     * @tc.name   testModelVol1071
     * @tc.number SUB_MC_MDL_1071
     * @tc.desc   MailType(type id 146, num 139, src id 546) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1071 begin');
      const m: MailType = new MailType(makeRes(146), 139, makeRes(546));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(139));
      expect(m.num).assertEqual(139);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(546);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1071 end');
    });

    /**
     * @tc.name   testModelVol1072
     * @tc.number SUB_MC_MDL_1072
     * @tc.desc   MailType(type id 147, num 142, src id 547) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1072 begin');
      const m: MailType = new MailType(makeRes(147), 142, makeRes(547));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(142));
      expect(m.num).assertEqual(142);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(147);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(547);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1072 end');
    });

    /**
     * @tc.name   testModelVol1073
     * @tc.number SUB_MC_MDL_1073
     * @tc.desc   MailType(type id 148, num 145, src id 548) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1073 begin');
      const m: MailType = new MailType(makeRes(148), 145, makeRes(548));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(145));
      expect(m.num).assertEqual(145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(548);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1073 end');
    });

    /**
     * @tc.name   testModelVol1074
     * @tc.number SUB_MC_MDL_1074
     * @tc.desc   MailType(type id 149, num 148, src id 549) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1074 begin');
      const m: MailType = new MailType(makeRes(149), 148, makeRes(549));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(148));
      expect(m.num).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(149);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(549);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1074 end');
    });

    /**
     * @tc.name   testModelVol1075
     * @tc.number SUB_MC_MDL_1075
     * @tc.desc   MailType(type id 150, num 151, src id 550) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1075 begin');
      const m: MailType = new MailType(makeRes(150), 151, makeRes(550));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(151));
      expect(m.num).assertEqual(151);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(550);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1075 end');
    });

    /**
     * @tc.name   testModelVol1076
     * @tc.number SUB_MC_MDL_1076
     * @tc.desc   MailType(type id 151, num 154, src id 551) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1076 begin');
      const m: MailType = new MailType(makeRes(151), 154, makeRes(551));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(154));
      expect(m.num).assertEqual(154);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(151);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(551);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1076 end');
    });

    /**
     * @tc.name   testModelVol1077
     * @tc.number SUB_MC_MDL_1077
     * @tc.desc   MailType(type id 152, num 157, src id 552) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1077 begin');
      const m: MailType = new MailType(makeRes(152), 157, makeRes(552));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(157));
      expect(m.num).assertEqual(157);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(552);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1077 end');
    });

    /**
     * @tc.name   testModelVol1078
     * @tc.number SUB_MC_MDL_1078
     * @tc.desc   MailType(type id 153, num 160, src id 553) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1078 begin');
      const m: MailType = new MailType(makeRes(153), 160, makeRes(553));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(160));
      expect(m.num).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(153);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(553);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1078 end');
    });

    /**
     * @tc.name   testModelVol1079
     * @tc.number SUB_MC_MDL_1079
     * @tc.desc   MailType(type id 154, num 163, src id 554) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1079 begin');
      const m: MailType = new MailType(makeRes(154), 163, makeRes(554));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(163));
      expect(m.num).assertEqual(163);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(154);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(554);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1079 end');
    });

    /**
     * @tc.name   testModelVol1080
     * @tc.number SUB_MC_MDL_1080
     * @tc.desc   MailType(type id 155, num 166, src id 555) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1080 begin');
      const m: MailType = new MailType(makeRes(155), 166, makeRes(555));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(166));
      expect(m.num).assertEqual(166);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(155);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(555);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1080 end');
    });

    /**
     * @tc.name   testModelVol1081
     * @tc.number SUB_MC_MDL_1081
     * @tc.desc   MailType(type id 156, num 169, src id 556) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1081 begin');
      const m: MailType = new MailType(makeRes(156), 169, makeRes(556));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(169));
      expect(m.num).assertEqual(169);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(556);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1081 end');
    });

    /**
     * @tc.name   testModelVol1082
     * @tc.number SUB_MC_MDL_1082
     * @tc.desc   MailType(type id 157, num 172, src id 557) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1082 begin');
      const m: MailType = new MailType(makeRes(157), 172, makeRes(557));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(172));
      expect(m.num).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(157);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(557);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1082 end');
    });

    /**
     * @tc.name   testModelVol1083
     * @tc.number SUB_MC_MDL_1083
     * @tc.desc   MailType(type id 158, num 175, src id 558) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1083 begin');
      const m: MailType = new MailType(makeRes(158), 175, makeRes(558));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(175));
      expect(m.num).assertEqual(175);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(158);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(558);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1083 end');
    });

    /**
     * @tc.name   testModelVol1084
     * @tc.number SUB_MC_MDL_1084
     * @tc.desc   MailType(type id 159, num 178, src id 559) keeps all three fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1084 begin');
      const m: MailType = new MailType(makeRes(159), 178, makeRes(559));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.num), String(178));
      expect(m.num).assertEqual(178);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeId=%{public}s', String(m.type.id));
      expect(m.type.id).assertEqual(159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String(m.src.id));
      expect(m.src.id).assertEqual(559);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1084 end');
    });

    /**
     * @tc.name   testModelVol1085
     * @tc.number SUB_MC_MDL_1085
     * @tc.desc   photoType(name id 260, count 302, src id 760) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1085 begin');
      const p: photoType = new photoType(makeRes(260), 302, makeRes(760));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(302));
      expect(p.count).assertEqual(302);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(760);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1085 end');
    });

    /**
     * @tc.name   testModelVol1086
     * @tc.number SUB_MC_MDL_1086
     * @tc.desc   photoType(name id 261, count 307, src id 761) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1086 begin');
      const p: photoType = new photoType(makeRes(261), 307, makeRes(761));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(307));
      expect(p.count).assertEqual(307);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(261);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(761);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1086 end');
    });

    /**
     * @tc.name   testModelVol1087
     * @tc.number SUB_MC_MDL_1087
     * @tc.desc   photoType(name id 262, count 312, src id 762) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1087 begin');
      const p: photoType = new photoType(makeRes(262), 312, makeRes(762));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(312));
      expect(p.count).assertEqual(312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(262);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(762);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1087 end');
    });

    /**
     * @tc.name   testModelVol1088
     * @tc.number SUB_MC_MDL_1088
     * @tc.desc   photoType(name id 263, count 317, src id 763) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1088 begin');
      const p: photoType = new photoType(makeRes(263), 317, makeRes(763));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(317));
      expect(p.count).assertEqual(317);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(263);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(763);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1088 end');
    });

    /**
     * @tc.name   testModelVol1089
     * @tc.number SUB_MC_MDL_1089
     * @tc.desc   photoType(name id 264, count 322, src id 764) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1089 begin');
      const p: photoType = new photoType(makeRes(264), 322, makeRes(764));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(322));
      expect(p.count).assertEqual(322);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(264);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(764);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1089 end');
    });

    /**
     * @tc.name   testModelVol1090
     * @tc.number SUB_MC_MDL_1090
     * @tc.desc   photoType(name id 265, count 327, src id 765) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1090 begin');
      const p: photoType = new photoType(makeRes(265), 327, makeRes(765));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(327));
      expect(p.count).assertEqual(327);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(265);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(765);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1090 end');
    });

    /**
     * @tc.name   testModelVol1091
     * @tc.number SUB_MC_MDL_1091
     * @tc.desc   photoType(name id 266, count 332, src id 766) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1091 begin');
      const p: photoType = new photoType(makeRes(266), 332, makeRes(766));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(332));
      expect(p.count).assertEqual(332);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(266);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(766);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1091 end');
    });

    /**
     * @tc.name   testModelVol1092
     * @tc.number SUB_MC_MDL_1092
     * @tc.desc   photoType(name id 267, count 337, src id 767) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1092 begin');
      const p: photoType = new photoType(makeRes(267), 337, makeRes(767));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(337));
      expect(p.count).assertEqual(337);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(267);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(767);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1092 end');
    });

    /**
     * @tc.name   testModelVol1093
     * @tc.number SUB_MC_MDL_1093
     * @tc.desc   photoType(name id 268, count 342, src id 768) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1093 begin');
      const p: photoType = new photoType(makeRes(268), 342, makeRes(768));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(342));
      expect(p.count).assertEqual(342);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(268);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1093 end');
    });

    /**
     * @tc.name   testModelVol1094
     * @tc.number SUB_MC_MDL_1094
     * @tc.desc   photoType(name id 269, count 347, src id 769) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1094 begin');
      const p: photoType = new photoType(makeRes(269), 347, makeRes(769));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(347));
      expect(p.count).assertEqual(347);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(269);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(769);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1094 end');
    });

    /**
     * @tc.name   testModelVol1095
     * @tc.number SUB_MC_MDL_1095
     * @tc.desc   photoType(name id 270, count 352, src id 770) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1095 begin');
      const p: photoType = new photoType(makeRes(270), 352, makeRes(770));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(352));
      expect(p.count).assertEqual(352);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(270);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(770);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1095 end');
    });

    /**
     * @tc.name   testModelVol1096
     * @tc.number SUB_MC_MDL_1096
     * @tc.desc   photoType(name id 271, count 357, src id 771) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1096 begin');
      const p: photoType = new photoType(makeRes(271), 357, makeRes(771));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(357));
      expect(p.count).assertEqual(357);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(271);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(771);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1096 end');
    });

    /**
     * @tc.name   testModelVol1097
     * @tc.number SUB_MC_MDL_1097
     * @tc.desc   photoType(name id 272, count 362, src id 772) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1097 begin');
      const p: photoType = new photoType(makeRes(272), 362, makeRes(772));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(362));
      expect(p.count).assertEqual(362);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(772);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1097 end');
    });

    /**
     * @tc.name   testModelVol1098
     * @tc.number SUB_MC_MDL_1098
     * @tc.desc   photoType(name id 273, count 367, src id 773) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1098 begin');
      const p: photoType = new photoType(makeRes(273), 367, makeRes(773));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(367));
      expect(p.count).assertEqual(367);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(273);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(773);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1098 end');
    });

    /**
     * @tc.name   testModelVol1099
     * @tc.number SUB_MC_MDL_1099
     * @tc.desc   photoType(name id 274, count 372, src id 774) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1099 begin');
      const p: photoType = new photoType(makeRes(274), 372, makeRes(774));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(372));
      expect(p.count).assertEqual(372);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(274);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(774);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1099 end');
    });

  });
}
