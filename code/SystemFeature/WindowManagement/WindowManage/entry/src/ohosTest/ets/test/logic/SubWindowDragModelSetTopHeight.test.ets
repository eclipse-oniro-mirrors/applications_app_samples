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

/** Logic checks for SubWindowDragModel.setTopHeight (90 cases). */
export default function subWindowDragModelSetTopHeightTest(): void {
  describe('SubWindowDragModelSetTopHeightTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0001
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0001
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0001',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0001 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1);
      logInfo(`setTopHeight(topHeight=1) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0002
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0002
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0002',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0002 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(100);
      logInfo(`setTopHeight(topHeight=100) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0003
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0003
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=360) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0003',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0003 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(360);
      logInfo(`setTopHeight(topHeight=360) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0004
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0004
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=720) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0004',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0004 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(720);
      logInfo(`setTopHeight(topHeight=720) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0005
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0005
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1080) yields 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0005',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0005 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1080);
      logInfo(`setTopHeight(topHeight=1080) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0006
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0006
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1920) yields 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0006',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0006 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1920);
      logInfo(`setTopHeight(topHeight=1920) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0007
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0007
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0007',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0007 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-1);
      logInfo(`setTopHeight(topHeight=-1) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0008
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0008
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0008',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0008 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(2);
      logInfo(`setTopHeight(topHeight=2) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0009
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0009
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0009',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0009 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3);
      logInfo(`setTopHeight(topHeight=3) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0010
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0010
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0010',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0010 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(10);
      logInfo(`setTopHeight(topHeight=10) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0011
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0011
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=96) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0011',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0011 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(96);
      logInfo(`setTopHeight(topHeight=96) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0012
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0012
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=192) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0012',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0012 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(192);
      logInfo(`setTopHeight(topHeight=192) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0013
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0013
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=288) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0013',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0013 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(288);
      logInfo(`setTopHeight(topHeight=288) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0014
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0014
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=384) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0014',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0014 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(384);
      logInfo(`setTopHeight(topHeight=384) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0015
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0015
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=480) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0015',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0015 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(480);
      logInfo(`setTopHeight(topHeight=480) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0016
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0016
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=576) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0016',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0016 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(576);
      logInfo(`setTopHeight(topHeight=576) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0017
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0017
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=672) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0017',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0017 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(672);
      logInfo(`setTopHeight(topHeight=672) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0018
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0018
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=768) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0018',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0018 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(768);
      logInfo(`setTopHeight(topHeight=768) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0019
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0019
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=864) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0019',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0019 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(864);
      logInfo(`setTopHeight(topHeight=864) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0020
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0020
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=960) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0020',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0020 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(960);
      logInfo(`setTopHeight(topHeight=960) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0021
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0021
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1056) yields 1056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0021',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0021 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1056);
      logInfo(`setTopHeight(topHeight=1056) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0022
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0022
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1152) yields 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0022',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0022 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1152);
      logInfo(`setTopHeight(topHeight=1152) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0023
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0023
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1248) yields 1248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0023',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0023 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1248);
      logInfo(`setTopHeight(topHeight=1248) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0024
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0024
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1344) yields 1344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0024',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0024 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1344);
      logInfo(`setTopHeight(topHeight=1344) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0025
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0025
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1440) yields 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0025',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0025 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1440);
      logInfo(`setTopHeight(topHeight=1440) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1440);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0026
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0026
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1536) yields 1536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0026',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0026 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1536);
      logInfo(`setTopHeight(topHeight=1536) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0027
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0027
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1632) yields 1632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0027',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0027 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1632);
      logInfo(`setTopHeight(topHeight=1632) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1632);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0028
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0028
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1728) yields 1728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0028',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0028 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1728);
      logInfo(`setTopHeight(topHeight=1728) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0029
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0029
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1824) yields 1824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0029',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0029 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1824);
      logInfo(`setTopHeight(topHeight=1824) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0030
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0030
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2016) yields 2016
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0030',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0030 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2016);
      logInfo(`setTopHeight(topHeight=2016) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2016);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0031
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0031
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2112) yields 2112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0031',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0031 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2112);
      logInfo(`setTopHeight(topHeight=2112) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2112);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0032
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0032
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2208) yields 2208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0032',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0032 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(2208);
      logInfo(`setTopHeight(topHeight=2208) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2208);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0033
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0033
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2304) yields 2304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0033',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0033 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2304);
      logInfo(`setTopHeight(topHeight=2304) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2304);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0034
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0034
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2400) yields 2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0034',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0034 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2400);
      logInfo(`setTopHeight(topHeight=2400) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2400);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0035
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0035
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2496) yields 2496
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0035',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0035 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(2496);
      logInfo(`setTopHeight(topHeight=2496) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2496);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0036
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0036
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2592) yields 2592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0036',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0036 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2592);
      logInfo(`setTopHeight(topHeight=2592) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2592);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0037
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0037
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2688) yields 2688
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0037',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0037 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2688);
      logInfo(`setTopHeight(topHeight=2688) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2688);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0038
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0038
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2784) yields 2784
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0038',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0038 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(2784);
      logInfo(`setTopHeight(topHeight=2784) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2784);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0039
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0039
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2880) yields 2880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0039',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0039 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2880);
      logInfo(`setTopHeight(topHeight=2880) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2880);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0040
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0040
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2976) yields 2976
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0040',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0040 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2976);
      logInfo(`setTopHeight(topHeight=2976) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2976);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0041
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0041
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3072) yields 3072
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0041',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0041 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(3072);
      logInfo(`setTopHeight(topHeight=3072) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3072);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0042
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0042
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3168) yields 3168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0042',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0042 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3168);
      logInfo(`setTopHeight(topHeight=3168) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3168);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0043
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0043
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3264) yields 3264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0043',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0043 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(3264);
      logInfo(`setTopHeight(topHeight=3264) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3264);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0044
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0044
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3360) yields 3360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0044',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0044 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(3360);
      logInfo(`setTopHeight(topHeight=3360) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3360);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0045
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0045
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3456) yields 3456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0045',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0045 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3456);
      logInfo(`setTopHeight(topHeight=3456) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3456);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0046
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0046
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3552) yields 3552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0046',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0046 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(3552);
      logInfo(`setTopHeight(topHeight=3552) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3552);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0047
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0047
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3648) yields 3648
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0047',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0047 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(3648);
      logInfo(`setTopHeight(topHeight=3648) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3648);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0048
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0048
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3744) yields 3744
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0048',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0048 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3744);
      logInfo(`setTopHeight(topHeight=3744) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3744);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0049
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0049
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3840) yields 3840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0049',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0049 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(3840);
      logInfo(`setTopHeight(topHeight=3840) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3840);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0050
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0050
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-901) yields -901
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0050',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0050 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-901);
      logInfo(`setTopHeight(topHeight=-901) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-901);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0051
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0051
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1823) yields 1823
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0051',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0051 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1823);
      logInfo(`setTopHeight(topHeight=1823) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1823);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0052
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0052
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1054.19) yields 1054.19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0052',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0052 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1054.19);
      logInfo(`setTopHeight(topHeight=1054.19) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1054.19, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0053
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0053
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-892) yields -892
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0053',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0053 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-892);
      logInfo(`setTopHeight(topHeight=-892) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-892);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0054
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0054
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=412.7) yields 412.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0054',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0054 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(412.7);
      logInfo(`setTopHeight(topHeight=412.7) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(412.7, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0055
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0055
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-266) yields -266
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0055',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0055 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-266);
      logInfo(`setTopHeight(topHeight=-266) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-266);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0056
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0056
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=848) yields 848
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0056',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0056 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(848);
      logInfo(`setTopHeight(topHeight=848) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(848);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0057
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0057
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1132) yields -1132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0057',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0057 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-1132);
      logInfo(`setTopHeight(topHeight=-1132) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1132);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0058
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0058
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2339) yields 2339
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0058',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0058 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2339);
      logInfo(`setTopHeight(topHeight=2339) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2339);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0059
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0059
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-309) yields -309
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0059',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0059 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-309);
      logInfo(`setTopHeight(topHeight=-309) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-309);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0060
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0060
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-202) yields -202
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0060',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0060 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-202);
      logInfo(`setTopHeight(topHeight=-202) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-202);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0061
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0061
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1981) yields 1981
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0061',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0061 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1981);
      logInfo(`setTopHeight(topHeight=1981) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1981);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0062
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0062
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-203) yields -203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0062',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0062 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-203);
      logInfo(`setTopHeight(topHeight=-203) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-203);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0063
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0063
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2054) yields 2054
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0063',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0063 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2054);
      logInfo(`setTopHeight(topHeight=2054) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2054);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0064
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0064
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1107) yields -1107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0064',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0064 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-1107);
      logInfo(`setTopHeight(topHeight=-1107) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1107);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0065
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0065
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=596.16) yields 596.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0065',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0065 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(596.16);
      logInfo(`setTopHeight(topHeight=596.16) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(596.16, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0066
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0066
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1678) yields 1678
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0066',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0066 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1678);
      logInfo(`setTopHeight(topHeight=1678) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1678);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0067
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0067
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3760) yields 3760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0067',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0067 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(3760);
      logInfo(`setTopHeight(topHeight=3760) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3760);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0068
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0068
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=861.1) yields 861.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0068',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0068 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(861.1);
      logInfo(`setTopHeight(topHeight=861.1) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(861.1, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0069
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0069
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1155.84) yields 1155.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0069',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0069 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1155.84);
      logInfo(`setTopHeight(topHeight=1155.84) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1155.84, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0070
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0070
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-166) yields -166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0070',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0070 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-166);
      logInfo(`setTopHeight(topHeight=-166) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-166);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0071
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0071
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2724) yields 2724
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0071',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0071 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(2724);
      logInfo(`setTopHeight(topHeight=2724) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2724);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0072
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0072
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1415) yields -1415
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0072',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0072 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-1415);
      logInfo(`setTopHeight(topHeight=-1415) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1415);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0073
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0073
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-1582) yields -1582
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0073',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0073 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-1582);
      logInfo(`setTopHeight(topHeight=-1582) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1582);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0074
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0074
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=53) yields 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0074',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0074 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(53);
      logInfo(`setTopHeight(topHeight=53) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(53);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0075
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0075
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=16) yields 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0075',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0075 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(16);
      logInfo(`setTopHeight(topHeight=16) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(16);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0076
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0076
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1821) yields 1821
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0076',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0076 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1821);
      logInfo(`setTopHeight(topHeight=1821) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1821);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0077
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0077
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-642) yields -642
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0077',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0077 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-642);
      logInfo(`setTopHeight(topHeight=-642) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-642);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0078
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0078
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=3437) yields 3437
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0078',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0078 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3437);
      logInfo(`setTopHeight(topHeight=3437) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3437);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0079
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0079
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1743) yields 1743
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0079',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0079 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1743);
      logInfo(`setTopHeight(topHeight=1743) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1743);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0080
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0080
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=847.11) yields 847.11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0080',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0080 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(847.11);
      logInfo(`setTopHeight(topHeight=847.11) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(847.11, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0081
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0081
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-116) yields -116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0081',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0081 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-116);
      logInfo(`setTopHeight(topHeight=-116) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-116);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0082
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0082
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1179) yields 1179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0082',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0082 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1179);
      logInfo(`setTopHeight(topHeight=1179) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1179);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0083
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0083
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=-215) yields -215
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0083',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0083 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-215);
      logInfo(`setTopHeight(topHeight=-215) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-215);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0084
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0084
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1179.9) yields 1179.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0084',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0084 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1179.9);
      logInfo(`setTopHeight(topHeight=1179.9) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1179.9, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0085
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0085
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=719) yields 719
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0085',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0085 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(719);
      logInfo(`setTopHeight(topHeight=719) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(719);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0086
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0086
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1817.61) yields 1817.61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0086',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0086 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1817.61);
      logInfo(`setTopHeight(topHeight=1817.61) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1817.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0087
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0087
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2756) yields 2756
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0087',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0087 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2756);
      logInfo(`setTopHeight(topHeight=2756) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2756);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0088
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0088
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=2278) yields 2278
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0088',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0088 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2278);
      logInfo(`setTopHeight(topHeight=2278) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2278);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0089
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0089
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=1886.92) yields 1886.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0089',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0089 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1886.92);
      logInfo(`setTopHeight(topHeight=1886.92) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1886.92, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_SET_TOP_HEIGHT_0090
     * @tc.name      WindowManage_SubWindowDragModelSetTopHeight_0090
     * @tc.desc      SubWindowDragModel.setTopHeight(topHeight=8) yields 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelSetTopHeight_0090',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0090 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(8);
      logInfo(`setTopHeight(topHeight=8) state: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(8);
      logInfo(`${BUNDLE}SubWindowDragModelSetTopHeight_0090 end`);
    });
  });
}
