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
const LOG_TAG: string = '[MultiColumns_MDL2]';

function makeRes(id: number): Resource {
  return {
    id: id,
    type: 10001,
    bundleName: 'com.samples.multicolumns',
    moduleName: 'entry',
    params: [] as Array<string | number>
  };
}

export default function modelVol02Test() {
  describe('MultiColumnsModelVol02', () => {

    /**
     * @tc.name   testModelVol1100
     * @tc.number SUB_MC_MDL_1100
     * @tc.desc   photoType(name id 275, count 377, src id 775) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1100 begin');
      const p: photoType = new photoType(makeRes(275), 377, makeRes(775));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(377));
      expect(p.count).assertEqual(377);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(275);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(775);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1100 end');
    });

    /**
     * @tc.name   testModelVol1101
     * @tc.number SUB_MC_MDL_1101
     * @tc.desc   photoType(name id 276, count 382, src id 776) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1101 begin');
      const p: photoType = new photoType(makeRes(276), 382, makeRes(776));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(382));
      expect(p.count).assertEqual(382);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(276);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(776);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1101 end');
    });

    /**
     * @tc.name   testModelVol1102
     * @tc.number SUB_MC_MDL_1102
     * @tc.desc   photoType(name id 277, count 387, src id 777) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1102 begin');
      const p: photoType = new photoType(makeRes(277), 387, makeRes(777));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(387));
      expect(p.count).assertEqual(387);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(277);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(777);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1102 end');
    });

    /**
     * @tc.name   testModelVol1103
     * @tc.number SUB_MC_MDL_1103
     * @tc.desc   photoType(name id 278, count 392, src id 778) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1103 begin');
      const p: photoType = new photoType(makeRes(278), 392, makeRes(778));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(392));
      expect(p.count).assertEqual(392);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(278);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(778);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1103 end');
    });

    /**
     * @tc.name   testModelVol1104
     * @tc.number SUB_MC_MDL_1104
     * @tc.desc   photoType(name id 279, count 397, src id 779) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1104 begin');
      const p: photoType = new photoType(makeRes(279), 397, makeRes(779));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(397));
      expect(p.count).assertEqual(397);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(279);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(779);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1104 end');
    });

    /**
     * @tc.name   testModelVol1105
     * @tc.number SUB_MC_MDL_1105
     * @tc.desc   photoType(name id 280, count 402, src id 780) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1105 begin');
      const p: photoType = new photoType(makeRes(280), 402, makeRes(780));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(402));
      expect(p.count).assertEqual(402);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(780);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1105 end');
    });

    /**
     * @tc.name   testModelVol1106
     * @tc.number SUB_MC_MDL_1106
     * @tc.desc   photoType(name id 281, count 407, src id 781) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1106 begin');
      const p: photoType = new photoType(makeRes(281), 407, makeRes(781));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(407));
      expect(p.count).assertEqual(407);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(281);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(781);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1106 end');
    });

    /**
     * @tc.name   testModelVol1107
     * @tc.number SUB_MC_MDL_1107
     * @tc.desc   photoType(name id 282, count 412, src id 782) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1107 begin');
      const p: photoType = new photoType(makeRes(282), 412, makeRes(782));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(412));
      expect(p.count).assertEqual(412);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(282);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(782);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1107 end');
    });

    /**
     * @tc.name   testModelVol1108
     * @tc.number SUB_MC_MDL_1108
     * @tc.desc   photoType(name id 283, count 417, src id 783) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1108 begin');
      const p: photoType = new photoType(makeRes(283), 417, makeRes(783));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(417));
      expect(p.count).assertEqual(417);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(283);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(783);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1108 end');
    });

    /**
     * @tc.name   testModelVol1109
     * @tc.number SUB_MC_MDL_1109
     * @tc.desc   photoType(name id 284, count 422, src id 784) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1109 begin');
      const p: photoType = new photoType(makeRes(284), 422, makeRes(784));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(422));
      expect(p.count).assertEqual(422);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(284);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(784);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1109 end');
    });

    /**
     * @tc.name   testModelVol1110
     * @tc.number SUB_MC_MDL_1110
     * @tc.desc   photoType(name id 285, count 427, src id 785) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1110 begin');
      const p: photoType = new photoType(makeRes(285), 427, makeRes(785));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(427));
      expect(p.count).assertEqual(427);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(285);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(785);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1110 end');
    });

    /**
     * @tc.name   testModelVol1111
     * @tc.number SUB_MC_MDL_1111
     * @tc.desc   photoType(name id 286, count 432, src id 786) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1111 begin');
      const p: photoType = new photoType(makeRes(286), 432, makeRes(786));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(432));
      expect(p.count).assertEqual(432);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(286);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(786);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1111 end');
    });

    /**
     * @tc.name   testModelVol1112
     * @tc.number SUB_MC_MDL_1112
     * @tc.desc   photoType(name id 287, count 437, src id 787) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1112 begin');
      const p: photoType = new photoType(makeRes(287), 437, makeRes(787));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(437));
      expect(p.count).assertEqual(437);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(287);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(787);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1112 end');
    });

    /**
     * @tc.name   testModelVol1113
     * @tc.number SUB_MC_MDL_1113
     * @tc.desc   photoType(name id 288, count 442, src id 788) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1113 begin');
      const p: photoType = new photoType(makeRes(288), 442, makeRes(788));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(442));
      expect(p.count).assertEqual(442);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(788);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1113 end');
    });

    /**
     * @tc.name   testModelVol1114
     * @tc.number SUB_MC_MDL_1114
     * @tc.desc   photoType(name id 289, count 447, src id 789) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1114 begin');
      const p: photoType = new photoType(makeRes(289), 447, makeRes(789));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(447));
      expect(p.count).assertEqual(447);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(289);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(789);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1114 end');
    });

    /**
     * @tc.name   testModelVol1115
     * @tc.number SUB_MC_MDL_1115
     * @tc.desc   photoType(name id 290, count 452, src id 790) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1115 begin');
      const p: photoType = new photoType(makeRes(290), 452, makeRes(790));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(452));
      expect(p.count).assertEqual(452);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(290);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(790);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1115 end');
    });

    /**
     * @tc.name   testModelVol1116
     * @tc.number SUB_MC_MDL_1116
     * @tc.desc   photoType(name id 291, count 457, src id 791) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1116 begin');
      const p: photoType = new photoType(makeRes(291), 457, makeRes(791));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(457));
      expect(p.count).assertEqual(457);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(291);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(791);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1116 end');
    });

    /**
     * @tc.name   testModelVol1117
     * @tc.number SUB_MC_MDL_1117
     * @tc.desc   photoType(name id 292, count 462, src id 792) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1117 begin');
      const p: photoType = new photoType(makeRes(292), 462, makeRes(792));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(462));
      expect(p.count).assertEqual(462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(292);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(792);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1117 end');
    });

    /**
     * @tc.name   testModelVol1118
     * @tc.number SUB_MC_MDL_1118
     * @tc.desc   photoType(name id 293, count 467, src id 793) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1118 begin');
      const p: photoType = new photoType(makeRes(293), 467, makeRes(793));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(467));
      expect(p.count).assertEqual(467);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(293);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(793);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1118 end');
    });

    /**
     * @tc.name   testModelVol1119
     * @tc.number SUB_MC_MDL_1119
     * @tc.desc   photoType(name id 294, count 472, src id 794) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1119 begin');
      const p: photoType = new photoType(makeRes(294), 472, makeRes(794));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(472));
      expect(p.count).assertEqual(472);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(294);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(794);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1119 end');
    });

    /**
     * @tc.name   testModelVol1120
     * @tc.number SUB_MC_MDL_1120
     * @tc.desc   photoType(name id 295, count 477, src id 795) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1120 begin');
      const p: photoType = new photoType(makeRes(295), 477, makeRes(795));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(477));
      expect(p.count).assertEqual(477);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(795);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1120 end');
    });

    /**
     * @tc.name   testModelVol1121
     * @tc.number SUB_MC_MDL_1121
     * @tc.desc   photoType(name id 296, count 482, src id 796) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1121 begin');
      const p: photoType = new photoType(makeRes(296), 482, makeRes(796));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(482));
      expect(p.count).assertEqual(482);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(296);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(796);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1121 end');
    });

    /**
     * @tc.name   testModelVol1122
     * @tc.number SUB_MC_MDL_1122
     * @tc.desc   photoType(name id 297, count 487, src id 797) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1122 begin');
      const p: photoType = new photoType(makeRes(297), 487, makeRes(797));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(487));
      expect(p.count).assertEqual(487);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(297);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(797);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1122 end');
    });

    /**
     * @tc.name   testModelVol1123
     * @tc.number SUB_MC_MDL_1123
     * @tc.desc   photoType(name id 298, count 492, src id 798) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1123 begin');
      const p: photoType = new photoType(makeRes(298), 492, makeRes(798));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(492));
      expect(p.count).assertEqual(492);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(298);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(798);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1123 end');
    });

    /**
     * @tc.name   testModelVol1124
     * @tc.number SUB_MC_MDL_1124
     * @tc.desc   photoType(name id 299, count 497, src id 799) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1124 begin');
      const p: photoType = new photoType(makeRes(299), 497, makeRes(799));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(497));
      expect(p.count).assertEqual(497);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(299);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(799);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1124 end');
    });

    /**
     * @tc.name   testModelVol1125
     * @tc.number SUB_MC_MDL_1125
     * @tc.desc   photoType(name id 300, count 502, src id 800) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1125 begin');
      const p: photoType = new photoType(makeRes(300), 502, makeRes(800));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(502));
      expect(p.count).assertEqual(502);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(800);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1125 end');
    });

    /**
     * @tc.name   testModelVol1126
     * @tc.number SUB_MC_MDL_1126
     * @tc.desc   photoType(name id 301, count 507, src id 801) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1126 begin');
      const p: photoType = new photoType(makeRes(301), 507, makeRes(801));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(507));
      expect(p.count).assertEqual(507);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(801);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1126 end');
    });

    /**
     * @tc.name   testModelVol1127
     * @tc.number SUB_MC_MDL_1127
     * @tc.desc   photoType(name id 302, count 512, src id 802) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1127 begin');
      const p: photoType = new photoType(makeRes(302), 512, makeRes(802));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(512));
      expect(p.count).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(302);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(802);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1127 end');
    });

    /**
     * @tc.name   testModelVol1128
     * @tc.number SUB_MC_MDL_1128
     * @tc.desc   photoType(name id 303, count 517, src id 803) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1128 begin');
      const p: photoType = new photoType(makeRes(303), 517, makeRes(803));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(517));
      expect(p.count).assertEqual(517);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(303);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(803);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1128 end');
    });

    /**
     * @tc.name   testModelVol1129
     * @tc.number SUB_MC_MDL_1129
     * @tc.desc   photoType(name id 304, count 522, src id 804) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1129 begin');
      const p: photoType = new photoType(makeRes(304), 522, makeRes(804));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(522));
      expect(p.count).assertEqual(522);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(304);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(804);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1129 end');
    });

    /**
     * @tc.name   testModelVol1130
     * @tc.number SUB_MC_MDL_1130
     * @tc.desc   photoType(name id 305, count 527, src id 805) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1130 begin');
      const p: photoType = new photoType(makeRes(305), 527, makeRes(805));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(527));
      expect(p.count).assertEqual(527);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(305);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(805);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1130 end');
    });

    /**
     * @tc.name   testModelVol1131
     * @tc.number SUB_MC_MDL_1131
     * @tc.desc   photoType(name id 306, count 532, src id 806) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1131 begin');
      const p: photoType = new photoType(makeRes(306), 532, makeRes(806));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(532));
      expect(p.count).assertEqual(532);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(306);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(806);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1131 end');
    });

    /**
     * @tc.name   testModelVol1132
     * @tc.number SUB_MC_MDL_1132
     * @tc.desc   photoType(name id 307, count 537, src id 807) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1132 begin');
      const p: photoType = new photoType(makeRes(307), 537, makeRes(807));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(537));
      expect(p.count).assertEqual(537);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(307);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(807);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1132 end');
    });

    /**
     * @tc.name   testModelVol1133
     * @tc.number SUB_MC_MDL_1133
     * @tc.desc   photoType(name id 308, count 542, src id 808) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1133 begin');
      const p: photoType = new photoType(makeRes(308), 542, makeRes(808));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(542));
      expect(p.count).assertEqual(542);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(808);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1133 end');
    });

    /**
     * @tc.name   testModelVol1134
     * @tc.number SUB_MC_MDL_1134
     * @tc.desc   photoType(name id 309, count 547, src id 809) keeps provided src
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1134 begin');
      const p: photoType = new photoType(makeRes(309), 547, makeRes(809));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(547));
      expect(p.count).assertEqual(547);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(309);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'srcId=%{public}s', String((p.src as Resource).id));
      expect((p.src as Resource).id).assertEqual(809);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1134 end');
    });

    /**
     * @tc.name   testModelVol1135
     * @tc.number SUB_MC_MDL_1135
     * @tc.desc   photoType omitted src stays undefined while name/count stored (410/227)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1135 begin');
      const p: photoType = new photoType(makeRes(410), 227);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(227));
      expect(p.count).assertEqual(227);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(410);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1135 end');
    });

    /**
     * @tc.name   testModelVol1136
     * @tc.number SUB_MC_MDL_1136
     * @tc.desc   photoType omitted src stays undefined while name/count stored (411/229)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1136 begin');
      const p: photoType = new photoType(makeRes(411), 229);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(229));
      expect(p.count).assertEqual(229);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(411);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1136 end');
    });

    /**
     * @tc.name   testModelVol1137
     * @tc.number SUB_MC_MDL_1137
     * @tc.desc   photoType omitted src stays undefined while name/count stored (412/231)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1137 begin');
      const p: photoType = new photoType(makeRes(412), 231);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(231));
      expect(p.count).assertEqual(231);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(412);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1137 end');
    });

    /**
     * @tc.name   testModelVol1138
     * @tc.number SUB_MC_MDL_1138
     * @tc.desc   photoType omitted src stays undefined while name/count stored (413/233)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1138 begin');
      const p: photoType = new photoType(makeRes(413), 233);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(233));
      expect(p.count).assertEqual(233);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(413);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1138 end');
    });

    /**
     * @tc.name   testModelVol1139
     * @tc.number SUB_MC_MDL_1139
     * @tc.desc   photoType omitted src stays undefined while name/count stored (414/235)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1139 begin');
      const p: photoType = new photoType(makeRes(414), 235);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(235));
      expect(p.count).assertEqual(235);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(414);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1139 end');
    });

    /**
     * @tc.name   testModelVol1140
     * @tc.number SUB_MC_MDL_1140
     * @tc.desc   photoType omitted src stays undefined while name/count stored (415/237)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1140 begin');
      const p: photoType = new photoType(makeRes(415), 237);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(237));
      expect(p.count).assertEqual(237);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(415);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1140 end');
    });

    /**
     * @tc.name   testModelVol1141
     * @tc.number SUB_MC_MDL_1141
     * @tc.desc   photoType omitted src stays undefined while name/count stored (416/239)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1141 begin');
      const p: photoType = new photoType(makeRes(416), 239);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(239));
      expect(p.count).assertEqual(239);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(416);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1141 end');
    });

    /**
     * @tc.name   testModelVol1142
     * @tc.number SUB_MC_MDL_1142
     * @tc.desc   photoType omitted src stays undefined while name/count stored (417/241)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1142 begin');
      const p: photoType = new photoType(makeRes(417), 241);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(241));
      expect(p.count).assertEqual(241);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(417);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1142 end');
    });

    /**
     * @tc.name   testModelVol1143
     * @tc.number SUB_MC_MDL_1143
     * @tc.desc   photoType omitted src stays undefined while name/count stored (418/243)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1143 begin');
      const p: photoType = new photoType(makeRes(418), 243);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(243));
      expect(p.count).assertEqual(243);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(418);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1143 end');
    });

    /**
     * @tc.name   testModelVol1144
     * @tc.number SUB_MC_MDL_1144
     * @tc.desc   photoType omitted src stays undefined while name/count stored (419/245)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1144 begin');
      const p: photoType = new photoType(makeRes(419), 245);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(245));
      expect(p.count).assertEqual(245);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(419);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1144 end');
    });

    /**
     * @tc.name   testModelVol1145
     * @tc.number SUB_MC_MDL_1145
     * @tc.desc   photoType omitted src stays undefined while name/count stored (420/247)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1145 begin');
      const p: photoType = new photoType(makeRes(420), 247);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(247));
      expect(p.count).assertEqual(247);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(420);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1145 end');
    });

    /**
     * @tc.name   testModelVol1146
     * @tc.number SUB_MC_MDL_1146
     * @tc.desc   photoType omitted src stays undefined while name/count stored (421/249)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1146 begin');
      const p: photoType = new photoType(makeRes(421), 249);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(249));
      expect(p.count).assertEqual(249);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(421);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1146 end');
    });

    /**
     * @tc.name   testModelVol1147
     * @tc.number SUB_MC_MDL_1147
     * @tc.desc   photoType omitted src stays undefined while name/count stored (422/251)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1147 begin');
      const p: photoType = new photoType(makeRes(422), 251);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(251));
      expect(p.count).assertEqual(251);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(422);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1147 end');
    });

    /**
     * @tc.name   testModelVol1148
     * @tc.number SUB_MC_MDL_1148
     * @tc.desc   photoType omitted src stays undefined while name/count stored (423/253)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1148 begin');
      const p: photoType = new photoType(makeRes(423), 253);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(253));
      expect(p.count).assertEqual(253);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(423);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1148 end');
    });

    /**
     * @tc.name   testModelVol1149
     * @tc.number SUB_MC_MDL_1149
     * @tc.desc   photoType omitted src stays undefined while name/count stored (424/255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1149 begin');
      const p: photoType = new photoType(makeRes(424), 255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(255));
      expect(p.count).assertEqual(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(424);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1149 end');
    });

    /**
     * @tc.name   testModelVol1150
     * @tc.number SUB_MC_MDL_1150
     * @tc.desc   photoType omitted src stays undefined while name/count stored (425/257)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1150 begin');
      const p: photoType = new photoType(makeRes(425), 257);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(257));
      expect(p.count).assertEqual(257);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(425);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1150 end');
    });

    /**
     * @tc.name   testModelVol1151
     * @tc.number SUB_MC_MDL_1151
     * @tc.desc   photoType omitted src stays undefined while name/count stored (426/259)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1151 begin');
      const p: photoType = new photoType(makeRes(426), 259);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(259));
      expect(p.count).assertEqual(259);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(426);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1151 end');
    });

    /**
     * @tc.name   testModelVol1152
     * @tc.number SUB_MC_MDL_1152
     * @tc.desc   photoType omitted src stays undefined while name/count stored (427/261)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1152 begin');
      const p: photoType = new photoType(makeRes(427), 261);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(261));
      expect(p.count).assertEqual(261);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(427);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1152 end');
    });

    /**
     * @tc.name   testModelVol1153
     * @tc.number SUB_MC_MDL_1153
     * @tc.desc   photoType omitted src stays undefined while name/count stored (428/263)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1153 begin');
      const p: photoType = new photoType(makeRes(428), 263);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(263));
      expect(p.count).assertEqual(263);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(428);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1153 end');
    });

    /**
     * @tc.name   testModelVol1154
     * @tc.number SUB_MC_MDL_1154
     * @tc.desc   photoType omitted src stays undefined while name/count stored (429/265)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1154 begin');
      const p: photoType = new photoType(makeRes(429), 265);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(p.count), String(265));
      expect(p.count).assertEqual(265);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(p.name.id));
      expect(p.name.id).assertEqual(429);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(p.src));
      expect(p.src).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1154 end');
    });

    /**
     * @tc.name   testModelVol1155
     * @tc.number SUB_MC_MDL_1155
     * @tc.desc   OperateTabs(src id 530, name id 1030) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1155 begin');
      const o: OperateTabs = new OperateTabs(makeRes(530), makeRes(1030));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(530));
      expect(o.src.id).assertEqual(530);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1030);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1560);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1155 end');
    });

    /**
     * @tc.name   testModelVol1156
     * @tc.number SUB_MC_MDL_1156
     * @tc.desc   OperateTabs(src id 531, name id 1031) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1156 begin');
      const o: OperateTabs = new OperateTabs(makeRes(531), makeRes(1031));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(531));
      expect(o.src.id).assertEqual(531);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1562);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1156 end');
    });

    /**
     * @tc.name   testModelVol1157
     * @tc.number SUB_MC_MDL_1157
     * @tc.desc   OperateTabs(src id 532, name id 1032) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1157 begin');
      const o: OperateTabs = new OperateTabs(makeRes(532), makeRes(1032));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(532));
      expect(o.src.id).assertEqual(532);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1564);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1157 end');
    });

    /**
     * @tc.name   testModelVol1158
     * @tc.number SUB_MC_MDL_1158
     * @tc.desc   OperateTabs(src id 533, name id 1033) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1158 begin');
      const o: OperateTabs = new OperateTabs(makeRes(533), makeRes(1033));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(533));
      expect(o.src.id).assertEqual(533);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1033);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1566);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1158 end');
    });

    /**
     * @tc.name   testModelVol1159
     * @tc.number SUB_MC_MDL_1159
     * @tc.desc   OperateTabs(src id 534, name id 1034) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1159 begin');
      const o: OperateTabs = new OperateTabs(makeRes(534), makeRes(1034));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(534));
      expect(o.src.id).assertEqual(534);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1034);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1568);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1159 end');
    });

    /**
     * @tc.name   testModelVol1160
     * @tc.number SUB_MC_MDL_1160
     * @tc.desc   OperateTabs(src id 535, name id 1035) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1160 begin');
      const o: OperateTabs = new OperateTabs(makeRes(535), makeRes(1035));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(535));
      expect(o.src.id).assertEqual(535);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1035);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1570);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1160 end');
    });

    /**
     * @tc.name   testModelVol1161
     * @tc.number SUB_MC_MDL_1161
     * @tc.desc   OperateTabs(src id 536, name id 1036) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1161 begin');
      const o: OperateTabs = new OperateTabs(makeRes(536), makeRes(1036));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(536));
      expect(o.src.id).assertEqual(536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1036);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1572);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1161 end');
    });

    /**
     * @tc.name   testModelVol1162
     * @tc.number SUB_MC_MDL_1162
     * @tc.desc   OperateTabs(src id 537, name id 1037) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1162 begin');
      const o: OperateTabs = new OperateTabs(makeRes(537), makeRes(1037));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(537));
      expect(o.src.id).assertEqual(537);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1574);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1162 end');
    });

    /**
     * @tc.name   testModelVol1163
     * @tc.number SUB_MC_MDL_1163
     * @tc.desc   OperateTabs(src id 538, name id 1038) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1163 begin');
      const o: OperateTabs = new OperateTabs(makeRes(538), makeRes(1038));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(538));
      expect(o.src.id).assertEqual(538);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1576);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1163 end');
    });

    /**
     * @tc.name   testModelVol1164
     * @tc.number SUB_MC_MDL_1164
     * @tc.desc   OperateTabs(src id 539, name id 1039) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1164 begin');
      const o: OperateTabs = new OperateTabs(makeRes(539), makeRes(1039));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(539));
      expect(o.src.id).assertEqual(539);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1578);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1164 end');
    });

    /**
     * @tc.name   testModelVol1165
     * @tc.number SUB_MC_MDL_1165
     * @tc.desc   OperateTabs(src id 540, name id 1040) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1165 begin');
      const o: OperateTabs = new OperateTabs(makeRes(540), makeRes(1040));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(540));
      expect(o.src.id).assertEqual(540);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1580);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1165 end');
    });

    /**
     * @tc.name   testModelVol1166
     * @tc.number SUB_MC_MDL_1166
     * @tc.desc   OperateTabs(src id 541, name id 1041) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1166 begin');
      const o: OperateTabs = new OperateTabs(makeRes(541), makeRes(1041));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(541));
      expect(o.src.id).assertEqual(541);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1582);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1166 end');
    });

    /**
     * @tc.name   testModelVol1167
     * @tc.number SUB_MC_MDL_1167
     * @tc.desc   OperateTabs(src id 542, name id 1042) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1167 begin');
      const o: OperateTabs = new OperateTabs(makeRes(542), makeRes(1042));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(542));
      expect(o.src.id).assertEqual(542);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1584);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1167 end');
    });

    /**
     * @tc.name   testModelVol1168
     * @tc.number SUB_MC_MDL_1168
     * @tc.desc   OperateTabs(src id 543, name id 1043) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1168 begin');
      const o: OperateTabs = new OperateTabs(makeRes(543), makeRes(1043));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(543));
      expect(o.src.id).assertEqual(543);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1586);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1168 end');
    });

    /**
     * @tc.name   testModelVol1169
     * @tc.number SUB_MC_MDL_1169
     * @tc.desc   OperateTabs(src id 544, name id 1044) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1169 begin');
      const o: OperateTabs = new OperateTabs(makeRes(544), makeRes(1044));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(544));
      expect(o.src.id).assertEqual(544);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1588);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1169 end');
    });

    /**
     * @tc.name   testModelVol1170
     * @tc.number SUB_MC_MDL_1170
     * @tc.desc   OperateTabs(src id 545, name id 1045) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1170 begin');
      const o: OperateTabs = new OperateTabs(makeRes(545), makeRes(1045));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(545));
      expect(o.src.id).assertEqual(545);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1590);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1170 end');
    });

    /**
     * @tc.name   testModelVol1171
     * @tc.number SUB_MC_MDL_1171
     * @tc.desc   OperateTabs(src id 546, name id 1046) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1171 begin');
      const o: OperateTabs = new OperateTabs(makeRes(546), makeRes(1046));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(546));
      expect(o.src.id).assertEqual(546);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1592);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1171 end');
    });

    /**
     * @tc.name   testModelVol1172
     * @tc.number SUB_MC_MDL_1172
     * @tc.desc   OperateTabs(src id 547, name id 1047) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1172 begin');
      const o: OperateTabs = new OperateTabs(makeRes(547), makeRes(1047));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(547));
      expect(o.src.id).assertEqual(547);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1594);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1172 end');
    });

    /**
     * @tc.name   testModelVol1173
     * @tc.number SUB_MC_MDL_1173
     * @tc.desc   OperateTabs(src id 548, name id 1048) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1173 begin');
      const o: OperateTabs = new OperateTabs(makeRes(548), makeRes(1048));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(548));
      expect(o.src.id).assertEqual(548);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1596);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1173 end');
    });

    /**
     * @tc.name   testModelVol1174
     * @tc.number SUB_MC_MDL_1174
     * @tc.desc   OperateTabs(src id 549, name id 1049) stores both resource references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModelVol1174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1174 begin');
      const o: OperateTabs = new OperateTabs(makeRes(549), makeRes(1049));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(o.src.id), String(549));
      expect(o.src.id).assertEqual(549);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nameId=%{public}s', String(o.name.id));
      expect(o.name.id).assertEqual(1049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}s', String(o.src.id + o.name.id));
      expect(o.src.id + o.name.id).assertEqual(1598);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModelVol1174 end');
    });

  });
}
