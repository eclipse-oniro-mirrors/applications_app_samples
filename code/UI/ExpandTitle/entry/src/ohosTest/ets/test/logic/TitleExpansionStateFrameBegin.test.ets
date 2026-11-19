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
import { TitleExpansionState } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for TitleExpansionState.frameBegin (88 cases). */
export default function titleExpansionStateFrameBeginTest(): void {
  describe('TitleExpansionStateFrameBeginTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0001
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0001
     * @tc.desc      TitleExpansionState.frameBegin(offset=-100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0001 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-100);
      logInfo(`frameBegin(offset=-100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-100) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0002
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0002
     * @tc.desc      TitleExpansionState.frameBegin(offset=-1) yields 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0002 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-1);
      logInfo(`frameBegin(offset=-1): actual=${actual}`);
      expect(actual).assertEqual(81);
      logInfo(`frameBegin(offset=-1) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(81);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0003
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0003
     * @tc.desc      TitleExpansionState.frameBegin(offset=0) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0003 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(0);
      logInfo(`frameBegin(offset=0): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0004
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0004
     * @tc.desc      TitleExpansionState.frameBegin(offset=-15) yields 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0004 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-15);
      logInfo(`frameBegin(offset=-15): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`frameBegin(offset=-15) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(95);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0005
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0005
     * @tc.desc      TitleExpansionState.frameBegin(offset=-19) yields 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0005 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-19);
      logInfo(`frameBegin(offset=-19): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`frameBegin(offset=-19) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(99);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0006
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0006
     * @tc.desc      TitleExpansionState.frameBegin(offset=-6) yields 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0006 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-6);
      logInfo(`frameBegin(offset=-6): actual=${actual}`);
      expect(actual).assertEqual(86);
      logInfo(`frameBegin(offset=-6) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(86);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0007
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0007
     * @tc.desc      TitleExpansionState.frameBegin(offset=-7) yields 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0007 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-7);
      logInfo(`frameBegin(offset=-7): actual=${actual}`);
      expect(actual).assertEqual(87);
      logInfo(`frameBegin(offset=-7) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(87);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0008
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0008
     * @tc.desc      TitleExpansionState.frameBegin(offset=-2) yields 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0008 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-2);
      logInfo(`frameBegin(offset=-2): actual=${actual}`);
      expect(actual).assertEqual(82);
      logInfo(`frameBegin(offset=-2) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(82);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0009
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0009
     * @tc.desc      TitleExpansionState.frameBegin(offset=-17) yields 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0009 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-17);
      logInfo(`frameBegin(offset=-17): actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`frameBegin(offset=-17) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(97);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0010
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0010
     * @tc.desc      TitleExpansionState.frameBegin(offset=1) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0010 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(1);
      logInfo(`frameBegin(offset=1): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0011
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0011
     * @tc.desc      TitleExpansionState.frameBegin(offset=50) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0011 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(50);
      logInfo(`frameBegin(offset=50): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0012
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0012
     * @tc.desc      TitleExpansionState.frameBegin(offset=100) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0012 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(100);
      logInfo(`frameBegin(offset=100): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0013
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0013
     * @tc.desc      TitleExpansionState.frameBegin(offset=2) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0013 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(2);
      logInfo(`frameBegin(offset=2): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0014
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0014
     * @tc.desc      TitleExpansionState.frameBegin(offset=3) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0014 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(3);
      logInfo(`frameBegin(offset=3): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0015
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0015
     * @tc.desc      TitleExpansionState.frameBegin(offset=10) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0015 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(10);
      logInfo(`frameBegin(offset=10): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0016
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0016
     * @tc.desc      TitleExpansionState.frameBegin(offset=5) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0016 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(5);
      logInfo(`frameBegin(offset=5): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0017
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0017
     * @tc.desc      TitleExpansionState.frameBegin(offset=15) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0017 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(15);
      logInfo(`frameBegin(offset=15): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0018
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0018
     * @tc.desc      TitleExpansionState.frameBegin(offset=20) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0018 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(20);
      logInfo(`frameBegin(offset=20): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0019
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0019
     * @tc.desc      TitleExpansionState.frameBegin(offset=25) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0019 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(25);
      logInfo(`frameBegin(offset=25): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0020
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0020
     * @tc.desc      TitleExpansionState.frameBegin(offset=30) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0020 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(30);
      logInfo(`frameBegin(offset=30): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0021
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0021
     * @tc.desc      TitleExpansionState.frameBegin(offset=35) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0021 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(35);
      logInfo(`frameBegin(offset=35): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0022
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0022
     * @tc.desc      TitleExpansionState.frameBegin(offset=40) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0022 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(40);
      logInfo(`frameBegin(offset=40): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0023
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0023
     * @tc.desc      TitleExpansionState.frameBegin(offset=45) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0023 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(45);
      logInfo(`frameBegin(offset=45): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0024
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0024
     * @tc.desc      TitleExpansionState.frameBegin(offset=55) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0024 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(55);
      logInfo(`frameBegin(offset=55): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0025
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0025
     * @tc.desc      TitleExpansionState.frameBegin(offset=60) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0025 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(60);
      logInfo(`frameBegin(offset=60): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0026
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0026
     * @tc.desc      TitleExpansionState.frameBegin(offset=65) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0026 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(65);
      logInfo(`frameBegin(offset=65): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0027
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0027
     * @tc.desc      TitleExpansionState.frameBegin(offset=70) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0027 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(70);
      logInfo(`frameBegin(offset=70): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0028
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0028
     * @tc.desc      TitleExpansionState.frameBegin(offset=75) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0028 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(75);
      logInfo(`frameBegin(offset=75): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0029
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0029
     * @tc.desc      TitleExpansionState.frameBegin(offset=80) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0029 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(80);
      logInfo(`frameBegin(offset=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0030
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0030
     * @tc.desc      TitleExpansionState.frameBegin(offset=85) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0030 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(85);
      logInfo(`frameBegin(offset=85): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0031
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0031
     * @tc.desc      TitleExpansionState.frameBegin(offset=90) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0031 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(90);
      logInfo(`frameBegin(offset=90): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0032
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0032
     * @tc.desc      TitleExpansionState.frameBegin(offset=95) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0032 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(95);
      logInfo(`frameBegin(offset=95): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0033
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0033
     * @tc.desc      TitleExpansionState.frameBegin(offset=105) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0033 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(105);
      logInfo(`frameBegin(offset=105): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0034
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0034
     * @tc.desc      TitleExpansionState.frameBegin(offset=110) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0034 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(110);
      logInfo(`frameBegin(offset=110): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0035
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0035
     * @tc.desc      TitleExpansionState.frameBegin(offset=115) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0035 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(115);
      logInfo(`frameBegin(offset=115): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0036
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0036
     * @tc.desc      TitleExpansionState.frameBegin(offset=120) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0036 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(120);
      logInfo(`frameBegin(offset=120): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0037
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0037
     * @tc.desc      TitleExpansionState.frameBegin(offset=125) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0037 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(125);
      logInfo(`frameBegin(offset=125): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0038
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0038
     * @tc.desc      TitleExpansionState.frameBegin(offset=130) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0038 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(130);
      logInfo(`frameBegin(offset=130): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0039
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0039
     * @tc.desc      TitleExpansionState.frameBegin(offset=135) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0039 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(135);
      logInfo(`frameBegin(offset=135): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0040
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0040
     * @tc.desc      TitleExpansionState.frameBegin(offset=140) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0040 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(140);
      logInfo(`frameBegin(offset=140): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0041
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0041
     * @tc.desc      TitleExpansionState.frameBegin(offset=145) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0041 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(145);
      logInfo(`frameBegin(offset=145): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0042
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0042
     * @tc.desc      TitleExpansionState.frameBegin(offset=150) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0042 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(150);
      logInfo(`frameBegin(offset=150): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0043
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0043
     * @tc.desc      TitleExpansionState.frameBegin(offset=155) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0043 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(155);
      logInfo(`frameBegin(offset=155): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0044
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0044
     * @tc.desc      TitleExpansionState.frameBegin(offset=160) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0044 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(160);
      logInfo(`frameBegin(offset=160): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0045
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0045
     * @tc.desc      TitleExpansionState.frameBegin(offset=165) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0045 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(165);
      logInfo(`frameBegin(offset=165): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0046
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0046
     * @tc.desc      TitleExpansionState.frameBegin(offset=170) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0046 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(170);
      logInfo(`frameBegin(offset=170): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0047
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0047
     * @tc.desc      TitleExpansionState.frameBegin(offset=175) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0047 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(175);
      logInfo(`frameBegin(offset=175): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0048
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0048
     * @tc.desc      TitleExpansionState.frameBegin(offset=180) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0048 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(180);
      logInfo(`frameBegin(offset=180): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0049
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0049
     * @tc.desc      TitleExpansionState.frameBegin(offset=185) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0049 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(185);
      logInfo(`frameBegin(offset=185): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0050
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0050
     * @tc.desc      TitleExpansionState.frameBegin(offset=190) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0050 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(190);
      logInfo(`frameBegin(offset=190): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0051
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0051
     * @tc.desc      TitleExpansionState.frameBegin(offset=195) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0051 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(195);
      logInfo(`frameBegin(offset=195): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0052
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0052
     * @tc.desc      TitleExpansionState.frameBegin(offset=200) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0052 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(200);
      logInfo(`frameBegin(offset=200): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0053
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0053
     * @tc.desc      TitleExpansionState.frameBegin(offset=192) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0053 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(192);
      logInfo(`frameBegin(offset=192): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0054
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0054
     * @tc.desc      TitleExpansionState.frameBegin(offset=-73) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0054 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-73);
      logInfo(`frameBegin(offset=-73): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-73) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0055
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0055
     * @tc.desc      TitleExpansionState.frameBegin(offset=-23) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0055 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-23);
      logInfo(`frameBegin(offset=-23): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-23) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0056
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0056
     * @tc.desc      TitleExpansionState.frameBegin(offset=18.95) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0056 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(18.95);
      logInfo(`frameBegin(offset=18.95): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0057
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0057
     * @tc.desc      TitleExpansionState.frameBegin(offset=111) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0057 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(111);
      logInfo(`frameBegin(offset=111): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0058
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0058
     * @tc.desc      TitleExpansionState.frameBegin(offset=129) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0058 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(129);
      logInfo(`frameBegin(offset=129): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0059
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0059
     * @tc.desc      TitleExpansionState.frameBegin(offset=172) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0059 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(172);
      logInfo(`frameBegin(offset=172): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0060
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0060
     * @tc.desc      TitleExpansionState.frameBegin(offset=151) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0060 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(151);
      logInfo(`frameBegin(offset=151): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0061
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0061
     * @tc.desc      TitleExpansionState.frameBegin(offset=53.31) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0061 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(53.31);
      logInfo(`frameBegin(offset=53.31): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0062
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0062
     * @tc.desc      TitleExpansionState.frameBegin(offset=39.46) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0062 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(39.46);
      logInfo(`frameBegin(offset=39.46): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0063
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0063
     * @tc.desc      TitleExpansionState.frameBegin(offset=166) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0063 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(166);
      logInfo(`frameBegin(offset=166): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0064
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0064
     * @tc.desc      TitleExpansionState.frameBegin(offset=54.75) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0064 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(54.75);
      logInfo(`frameBegin(offset=54.75): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0065
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0065
     * @tc.desc      TitleExpansionState.frameBegin(offset=126) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0065 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(126);
      logInfo(`frameBegin(offset=126): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0066
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0066
     * @tc.desc      TitleExpansionState.frameBegin(offset=136) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0066 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(136);
      logInfo(`frameBegin(offset=136): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0067
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0067
     * @tc.desc      TitleExpansionState.frameBegin(offset=29) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0067 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(29);
      logInfo(`frameBegin(offset=29): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0068
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0068
     * @tc.desc      TitleExpansionState.frameBegin(offset=43.41) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0068 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(43.41);
      logInfo(`frameBegin(offset=43.41): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0069
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0069
     * @tc.desc      TitleExpansionState.frameBegin(offset=87) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0069 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(87);
      logInfo(`frameBegin(offset=87): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0070
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0070
     * @tc.desc      TitleExpansionState.frameBegin(offset=12) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0070 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(12);
      logInfo(`frameBegin(offset=12): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0071
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0071
     * @tc.desc      TitleExpansionState.frameBegin(offset=123) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0071 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(123);
      logInfo(`frameBegin(offset=123): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0072
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0072
     * @tc.desc      TitleExpansionState.frameBegin(offset=66) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0072 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(66);
      logInfo(`frameBegin(offset=66): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0073
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0073
     * @tc.desc      TitleExpansionState.frameBegin(offset=186) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0073 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(186);
      logInfo(`frameBegin(offset=186): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0074
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0074
     * @tc.desc      TitleExpansionState.frameBegin(offset=34.3) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0074 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(34.3);
      logInfo(`frameBegin(offset=34.3): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0075
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0075
     * @tc.desc      TitleExpansionState.frameBegin(offset=-83) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0075 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-83);
      logInfo(`frameBegin(offset=-83): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-83) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0076
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0076
     * @tc.desc      TitleExpansionState.frameBegin(offset=79) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0076 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(79);
      logInfo(`frameBegin(offset=79): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0077
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0077
     * @tc.desc      TitleExpansionState.frameBegin(offset=-69) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0077 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-69);
      logInfo(`frameBegin(offset=-69): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-69) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0078
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0078
     * @tc.desc      TitleExpansionState.frameBegin(offset=37.9) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0078 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(37.9);
      logInfo(`frameBegin(offset=37.9): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0079
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0079
     * @tc.desc      TitleExpansionState.frameBegin(offset=-43) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0079 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-43);
      logInfo(`frameBegin(offset=-43): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-43) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0080
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0080
     * @tc.desc      TitleExpansionState.frameBegin(offset=49) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0080 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(49);
      logInfo(`frameBegin(offset=49): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0081
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0081
     * @tc.desc      TitleExpansionState.frameBegin(offset=-45) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0081 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-45);
      logInfo(`frameBegin(offset=-45): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-45) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0082
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0082
     * @tc.desc      TitleExpansionState.frameBegin(offset=91) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0082 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(91);
      logInfo(`frameBegin(offset=91): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0083
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0083
     * @tc.desc      TitleExpansionState.frameBegin(offset=40.89) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0083 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(40.89);
      logInfo(`frameBegin(offset=40.89): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0084
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0084
     * @tc.desc      TitleExpansionState.frameBegin(offset=-79) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0084 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-79);
      logInfo(`frameBegin(offset=-79): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-79) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0085
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0085
     * @tc.desc      TitleExpansionState.frameBegin(offset=144) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0085 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(144);
      logInfo(`frameBegin(offset=144): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0086
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0086
     * @tc.desc      TitleExpansionState.frameBegin(offset=-31) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0086 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(-31);
      logInfo(`frameBegin(offset=-31): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`frameBegin(offset=-31) state: subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0087
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0087
     * @tc.desc      TitleExpansionState.frameBegin(offset=64.64) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0087 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(64.64);
      logInfo(`frameBegin(offset=64.64): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_FRAME_BEGIN_0088
     * @tc.name      ExpandTitle_TitleExpansionStateFrameBegin_0088
     * @tc.desc      TitleExpansionState.frameBegin(offset=73) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateFrameBegin_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0088 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.frameBegin(73);
      logInfo(`frameBegin(offset=73): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateFrameBegin_0088 end`);
    });
  });
}
