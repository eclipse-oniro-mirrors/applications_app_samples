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
import { FoldLayoutState } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FoldLayoutState.resize (75 cases). */
export default function foldLayoutStateResizeTest(): void {
  describe('FoldLayoutStateResizeTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0001
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0001
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FoldLayoutStateResize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0001 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 0);
      logInfo(`resize(windowWidth=0, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=0) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=0, densityPixels=0) state: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0002
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0002
     * @tc.desc      FoldLayoutState.resize(windowWidth=-1, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FoldLayoutStateResize_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0002 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(-1, 0);
      logInfo(`resize(windowWidth=-1, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=-1, densityPixels=0) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0003
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0003
     * @tc.desc      FoldLayoutState.resize(windowWidth=3840, densityPixels=5) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0003 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3840, 5);
      logInfo(`resize(windowWidth=3840, densityPixels=5): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3840, densityPixels=5)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('md');
      logInfo(`resize(windowWidth=3840, densityPixels=5)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0004
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0004
     * @tc.desc      FoldLayoutState.resize(windowWidth=1, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0004 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1, 0);
      logInfo(`resize(windowWidth=1, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1, densityPixels=0) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1, densityPixels=0) state: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0005
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0005
     * @tc.desc      FoldLayoutState.resize(windowWidth=2, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0005 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2, 0);
      logInfo(`resize(windowWidth=2, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2, densityPixels=0) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2, densityPixels=0) state: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0006
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0006
     * @tc.desc      FoldLayoutState.resize(windowWidth=3, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0006 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3, 0);
      logInfo(`resize(windowWidth=3, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3, densityPixels=0) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3, densityPixels=0) state: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0007
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0007
     * @tc.desc      FoldLayoutState.resize(windowWidth=4, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0007 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(4, 0);
      logInfo(`resize(windowWidth=4, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=4, densityPixels=0) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=4, densityPixels=0) state: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0008
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0008
     * @tc.desc      FoldLayoutState.resize(windowWidth=100, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0008 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(100, 0);
      logInfo(`resize(windowWidth=100, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=100, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=100, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0009
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0009
     * @tc.desc      FoldLayoutState.resize(windowWidth=360, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0009 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(360, 0);
      logInfo(`resize(windowWidth=360, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=360, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=360, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0010
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0010
     * @tc.desc      FoldLayoutState.resize(windowWidth=720, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0010 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(720, 0);
      logInfo(`resize(windowWidth=720, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=720, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=720, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0011
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0011
     * @tc.desc      FoldLayoutState.resize(windowWidth=1080, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0011 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1080, 0);
      logInfo(`resize(windowWidth=1080, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1080, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1080, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0012
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0012
     * @tc.desc      FoldLayoutState.resize(windowWidth=1920, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0012 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1920, 0);
      logInfo(`resize(windowWidth=1920, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1920, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1920, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0013
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0013
     * @tc.desc      FoldLayoutState.resize(windowWidth=10, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0013 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(10, 0);
      logInfo(`resize(windowWidth=10, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=10, densityPixels=0) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=10, densityPixels=0) s...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0014
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0014
     * @tc.desc      FoldLayoutState.resize(windowWidth=96, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0014 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(96, 0);
      logInfo(`resize(windowWidth=96, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=96, densityPixels=0) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=96, densityPixels=0) s...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0015
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0015
     * @tc.desc      FoldLayoutState.resize(windowWidth=192, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0015 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(192, 0);
      logInfo(`resize(windowWidth=192, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=192, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=192, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0016
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0016
     * @tc.desc      FoldLayoutState.resize(windowWidth=288, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0016 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(288, 0);
      logInfo(`resize(windowWidth=288, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=288, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=288, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0017
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0017
     * @tc.desc      FoldLayoutState.resize(windowWidth=384, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0017 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(384, 0);
      logInfo(`resize(windowWidth=384, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=384, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=384, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0018
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0018
     * @tc.desc      FoldLayoutState.resize(windowWidth=480, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0018 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(480, 0);
      logInfo(`resize(windowWidth=480, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=480, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=480, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0019
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0019
     * @tc.desc      FoldLayoutState.resize(windowWidth=576, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0019 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(576, 0);
      logInfo(`resize(windowWidth=576, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=576, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=576, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0020
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0020
     * @tc.desc      FoldLayoutState.resize(windowWidth=672, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0020 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(672, 0);
      logInfo(`resize(windowWidth=672, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=672, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=672, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0021
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0021
     * @tc.desc      FoldLayoutState.resize(windowWidth=768, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0021 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(768, 0);
      logInfo(`resize(windowWidth=768, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=768, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=768, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0022
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0022
     * @tc.desc      FoldLayoutState.resize(windowWidth=864, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0022 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(864, 0);
      logInfo(`resize(windowWidth=864, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=864, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=864, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0023
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0023
     * @tc.desc      FoldLayoutState.resize(windowWidth=960, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0023 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(960, 0);
      logInfo(`resize(windowWidth=960, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=960, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=960, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0024
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0024
     * @tc.desc      FoldLayoutState.resize(windowWidth=1056, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0024 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1056, 0);
      logInfo(`resize(windowWidth=1056, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1056, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1056, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0025
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0025
     * @tc.desc      FoldLayoutState.resize(windowWidth=1152, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0025 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1152, 0);
      logInfo(`resize(windowWidth=1152, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1152, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1152, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0026
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0026
     * @tc.desc      FoldLayoutState.resize(windowWidth=1248, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0026 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1248, 0);
      logInfo(`resize(windowWidth=1248, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1248, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1248, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0027
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0027
     * @tc.desc      FoldLayoutState.resize(windowWidth=1344, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0027 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1344, 0);
      logInfo(`resize(windowWidth=1344, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1344, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1344, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0028
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0028
     * @tc.desc      FoldLayoutState.resize(windowWidth=1440, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0028 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1440, 0);
      logInfo(`resize(windowWidth=1440, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1440, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1440, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0029
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0029
     * @tc.desc      FoldLayoutState.resize(windowWidth=1536, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0029 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1536, 0);
      logInfo(`resize(windowWidth=1536, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1536, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1536, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0030
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0030
     * @tc.desc      FoldLayoutState.resize(windowWidth=1632, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0030 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1632, 0);
      logInfo(`resize(windowWidth=1632, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1632, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1632, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0031
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0031
     * @tc.desc      FoldLayoutState.resize(windowWidth=1728, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0031 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1728, 0);
      logInfo(`resize(windowWidth=1728, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1728, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1728, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0032
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0032
     * @tc.desc      FoldLayoutState.resize(windowWidth=1824, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0032 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1824, 0);
      logInfo(`resize(windowWidth=1824, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1824, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1824, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0033
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0033
     * @tc.desc      FoldLayoutState.resize(windowWidth=2016, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0033 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2016, 0);
      logInfo(`resize(windowWidth=2016, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2016, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2016, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0034
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0034
     * @tc.desc      FoldLayoutState.resize(windowWidth=2112, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0034 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2112, 0);
      logInfo(`resize(windowWidth=2112, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2112, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2112, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0035
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0035
     * @tc.desc      FoldLayoutState.resize(windowWidth=2208, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0035 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2208, 0);
      logInfo(`resize(windowWidth=2208, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2208, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2208, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0036
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0036
     * @tc.desc      FoldLayoutState.resize(windowWidth=2304, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0036 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2304, 0);
      logInfo(`resize(windowWidth=2304, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2304, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2304, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0037
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0037
     * @tc.desc      FoldLayoutState.resize(windowWidth=2400, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0037 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2400, 0);
      logInfo(`resize(windowWidth=2400, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2400, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2400, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0038
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0038
     * @tc.desc      FoldLayoutState.resize(windowWidth=2496, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0038 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2496, 0);
      logInfo(`resize(windowWidth=2496, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2496, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2496, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0039
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0039
     * @tc.desc      FoldLayoutState.resize(windowWidth=2592, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0039 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2592, 0);
      logInfo(`resize(windowWidth=2592, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2592, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2592, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0040
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0040
     * @tc.desc      FoldLayoutState.resize(windowWidth=2688, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0040 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2688, 0);
      logInfo(`resize(windowWidth=2688, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2688, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2688, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0041
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0041
     * @tc.desc      FoldLayoutState.resize(windowWidth=2784, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0041 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2784, 0);
      logInfo(`resize(windowWidth=2784, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2784, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2784, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0042
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0042
     * @tc.desc      FoldLayoutState.resize(windowWidth=2880, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0042 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2880, 0);
      logInfo(`resize(windowWidth=2880, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2880, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2880, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0043
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0043
     * @tc.desc      FoldLayoutState.resize(windowWidth=2976, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0043 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2976, 0);
      logInfo(`resize(windowWidth=2976, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2976, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2976, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0044
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0044
     * @tc.desc      FoldLayoutState.resize(windowWidth=3072, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0044 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3072, 0);
      logInfo(`resize(windowWidth=3072, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3072, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3072, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0045
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0045
     * @tc.desc      FoldLayoutState.resize(windowWidth=3168, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0045 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3168, 0);
      logInfo(`resize(windowWidth=3168, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3168, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3168, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0046
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0046
     * @tc.desc      FoldLayoutState.resize(windowWidth=3264, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0046 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3264, 0);
      logInfo(`resize(windowWidth=3264, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3264, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3264, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0047
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0047
     * @tc.desc      FoldLayoutState.resize(windowWidth=3360, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0047 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3360, 0);
      logInfo(`resize(windowWidth=3360, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3360, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3360, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0048
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0048
     * @tc.desc      FoldLayoutState.resize(windowWidth=3456, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0048 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3456, 0);
      logInfo(`resize(windowWidth=3456, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3456, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3456, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0049
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0049
     * @tc.desc      FoldLayoutState.resize(windowWidth=3552, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0049 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3552, 0);
      logInfo(`resize(windowWidth=3552, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3552, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3552, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0050
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0050
     * @tc.desc      FoldLayoutState.resize(windowWidth=3648, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0050 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3648, 0);
      logInfo(`resize(windowWidth=3648, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3648, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3648, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0050 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0051
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0051
     * @tc.desc      FoldLayoutState.resize(windowWidth=3744, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0051 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3744, 0);
      logInfo(`resize(windowWidth=3744, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3744, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3744, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0052
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0052
     * @tc.desc      FoldLayoutState.resize(windowWidth=3840, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0052 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3840, 0);
      logInfo(`resize(windowWidth=3840, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3840, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3840, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0053
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0053
     * @tc.desc      FoldLayoutState.resize(windowWidth=-178, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStateResize_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0053 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(-178, 0);
      logInfo(`resize(windowWidth=-178, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=-178, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0054
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0054
     * @tc.desc      FoldLayoutState.resize(windowWidth=-1918, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStateResize_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0054 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(-1918, 0);
      logInfo(`resize(windowWidth=-1918, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=-1918, densityPixels=0...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0055
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0055
     * @tc.desc      FoldLayoutState.resize(windowWidth=1277, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0055 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1277, 0);
      logInfo(`resize(windowWidth=1277, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1277, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1277, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0056
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0056
     * @tc.desc      FoldLayoutState.resize(windowWidth=-240, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStateResize_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0056 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(-240, 0);
      logInfo(`resize(windowWidth=-240, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=-240, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0057
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0057
     * @tc.desc      FoldLayoutState.resize(windowWidth=2614, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0057 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2614, 0);
      logInfo(`resize(windowWidth=2614, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2614, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2614, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0058
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0058
     * @tc.desc      FoldLayoutState.resize(windowWidth=150, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0058 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(150, 0);
      logInfo(`resize(windowWidth=150, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=150, densityPixels=0) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=150, densityPixels=0) ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0059
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0059
     * @tc.desc      FoldLayoutState.resize(windowWidth=1652.93, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0059 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(1652.93, 0);
      logInfo(`resize(windowWidth=1652.93, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=1652.93, densityPixels...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=1652.93, densityPixels...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0060
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0060
     * @tc.desc      FoldLayoutState.resize(windowWidth=2562, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0060 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(2562, 0);
      logInfo(`resize(windowWidth=2562, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=2562, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=2562, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0061
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0061
     * @tc.desc      FoldLayoutState.resize(windowWidth=3093, densityPixels=0) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0061 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(3093, 0);
      logInfo(`resize(windowWidth=3093, densityPixels=0): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=3093, densityPixels=0)...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize(windowWidth=3093, densityPixels=0)...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateResize_0061 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0062
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0062
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=-1) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0062 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, -1);
      logInfo(`resize(windowWidth=0, densityPixels=-1): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=-1) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0063
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0063
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=1) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0063 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 1);
      logInfo(`resize(windowWidth=0, densityPixels=1): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=1) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0064
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0064
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=2) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0064 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 2);
      logInfo(`resize(windowWidth=0, densityPixels=2): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=2) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0065
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0065
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=3) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0065 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 3);
      logInfo(`resize(windowWidth=0, densityPixels=3): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=3) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0066
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0066
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=4) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FoldLayoutStateResize_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0066 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 4);
      logInfo(`resize(windowWidth=0, densityPixels=4): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=4) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0067
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0067
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=10) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0067 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 10);
      logInfo(`resize(windowWidth=0, densityPixels=10): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=10) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0068
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0068
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=100) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0068 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 100);
      logInfo(`resize(windowWidth=0, densityPixels=100): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=100) ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0069
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0069
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=5) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0069 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 5);
      logInfo(`resize(windowWidth=0, densityPixels=5): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=5) state: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0070
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0070
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=15) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0070 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 15);
      logInfo(`resize(windowWidth=0, densityPixels=15): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=15) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0071
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0071
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=20) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0071 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 20);
      logInfo(`resize(windowWidth=0, densityPixels=20): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=20) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0072
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0072
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=25) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0072 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 25);
      logInfo(`resize(windowWidth=0, densityPixels=25): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=25) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0073
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0073
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=30) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0073 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 30);
      logInfo(`resize(windowWidth=0, densityPixels=30): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=30) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0074
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0074
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=35) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0074 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 35);
      logInfo(`resize(windowWidth=0, densityPixels=35): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=35) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_RESIZE_0075
     * @tc.name      FoldableAdaptation_FoldLayoutStateResize_0075
     * @tc.desc      FoldLayoutState.resize(windowWidth=0, densityPixels=40) yields "Stack"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateResize_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateResize_0075 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.resize(0, 40);
      logInfo(`resize(windowWidth=0, densityPixels=40): actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`resize(windowWidth=0, densityPixels=40) s...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateResize_0075 end`);
    });
  });
}
