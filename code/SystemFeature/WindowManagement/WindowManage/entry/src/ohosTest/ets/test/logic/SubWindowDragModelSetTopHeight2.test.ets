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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SubWindowDragModel } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SubWindowDragModel.setTopHeight (29 cases). */
export default function subWindowDragModelSetTopHeight2Test(): void {
  describe('SubWindowDragModelSetTopHeight2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0091
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0091
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1419.16) yields 1419.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0091',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0091 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1419.16);
      logInfo(`setTopHeight(topHeight=1419.16) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1419.16, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0092
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0092
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=389.07) yields 389.07
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0092',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0092 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(389.07);
      logInfo(`setTopHeight(topHeight=389.07) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(389.07, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0093
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0093
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1145) yields -1145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0093',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0093 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-1145);
      logInfo(`setTopHeight(topHeight=-1145) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1145);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0094
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0094
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3145) yields 3145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0094',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0094 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(3145);
      logInfo(`setTopHeight(topHeight=3145) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3145);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0095
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0095
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-119) yields -119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0095',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0095 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-119);
      logInfo(`setTopHeight(topHeight=-119) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-119);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0096
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0096
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-890) yields -890
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0096',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0096 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-890);
      logInfo(`setTopHeight(topHeight=-890) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-890);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0096 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0097
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0097
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1214) yields 1214
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0097',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0097 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1214);
      logInfo(`setTopHeight(topHeight=1214) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1214);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0098
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0098
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-109) yields -109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0098',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0098 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-109);
      logInfo(`setTopHeight(topHeight=-109) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-109);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0099
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0099
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=892.43) yields 892.43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0099',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0099 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(892.43);
      logInfo(`setTopHeight(topHeight=892.43) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(892.43, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0100
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0100
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-200) yields -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0100',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0100 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-200);
      logInfo(`setTopHeight(topHeight=-200) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-200);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0101
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0101
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=118) yields 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0101',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0101 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(118);
      logInfo(`setTopHeight(topHeight=118) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(118);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0102
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0102
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3493) yields 3493
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0102',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0102 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3493);
      logInfo(`setTopHeight(topHeight=3493) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3493);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0103
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0103
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-99) yields -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0103',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0103 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-99);
      logInfo(`setTopHeight(topHeight=-99) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-99);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0104
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0104
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=845.05) yields 845.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0104',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0104 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(845.05);
      logInfo(`setTopHeight(topHeight=845.05) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(845.05, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0105
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0105
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1778) yields -1778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0105',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0105 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-1778);
      logInfo(`setTopHeight(topHeight=-1778) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1778);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0106
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0106
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=180.61) yields 180.61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0106',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0106 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(180.61);
      logInfo(`setTopHeight(topHeight=180.61) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(180.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0107
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0107
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1033) yields -1033
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0107',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0107 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-1033);
      logInfo(`setTopHeight(topHeight=-1033) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1033);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0108
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0108
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1426.35) yields 1426.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0108',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0108 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1426.35);
      logInfo(`setTopHeight(topHeight=1426.35) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1426.35, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0109
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0109
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-24) yields -24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0109',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0109 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-24);
      logInfo(`setTopHeight(topHeight=-24) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-24);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0110
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0110
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-444) yields -444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0110',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0110 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-444);
      logInfo(`setTopHeight(topHeight=-444) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-444);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0111
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0111
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=388.56) yields 388.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0111',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0111 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(388.56);
      logInfo(`setTopHeight(topHeight=388.56) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(388.56, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0112
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0112
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1446) yields -1446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0112',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0112 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-1446);
      logInfo(`setTopHeight(topHeight=-1446) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1446);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0113
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0113
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=601) yields 601
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0113',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0113 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(601);
      logInfo(`setTopHeight(topHeight=601) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(601);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0114
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0114
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1902.81) yields 1902.81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0114',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0114 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1902.81);
      logInfo(`setTopHeight(topHeight=1902.81) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1902.81, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0115
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0115
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-667) yields -667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0115',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0115 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-667);
      logInfo(`setTopHeight(topHeight=-667) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-667);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0116
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0116
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1464.21) yields 1464.21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0116',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0116 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1464.21);
      logInfo(`setTopHeight(topHeight=1464.21) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1464.21, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0117
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0117
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1675.2) yields 1675.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0117',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0117 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1675.2);
      logInfo(`setTopHeight(topHeight=1675.2) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1675.2, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0118
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0118
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1893) yields -1893
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0118',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0118 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-1893);
      logInfo(`setTopHeight(topHeight=-1893) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1893);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0119
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0119
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3265) yields 3265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0119',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0119 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(3265);
      logInfo(`setTopHeight(topHeight=3265) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3265);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0119 end`);
    });
  });
}
