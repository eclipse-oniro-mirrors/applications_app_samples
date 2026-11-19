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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for TitleExpansionState.didScroll (81 cases). */
export default function titleExpansionStateDidScrollTest(): void {
  describe('TitleExpansionStateDidScrollTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0001
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0001
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0001 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-100);
      logInfo(`didScroll(yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`didScroll(yOffset=-100) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-100);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0002
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0002
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0002 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-1);
      logInfo(`didScroll(yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`didScroll(yOffset=-1) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-1);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0003
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0003
     * @tc.desc      TitleExpansionState.didScroll(yOffset=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0003 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(0);
      logInfo(`didScroll(yOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0004
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0004
     * @tc.desc      TitleExpansionState.didScroll(yOffset=1) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0004 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(1);
      logInfo(`didScroll(yOffset=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=1) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(1);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0005
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0005
     * @tc.desc      TitleExpansionState.didScroll(yOffset=50) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0005 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(50);
      logInfo(`didScroll(yOffset=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=50) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(50);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0006
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0006
     * @tc.desc      TitleExpansionState.didScroll(yOffset=100) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0006 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(100);
      logInfo(`didScroll(yOffset=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=100) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(100);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0007
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0007
     * @tc.desc      TitleExpansionState.didScroll(yOffset=2) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0007 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(2);
      logInfo(`didScroll(yOffset=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=2) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(2);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0008
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0008
     * @tc.desc      TitleExpansionState.didScroll(yOffset=3) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0008 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(3);
      logInfo(`didScroll(yOffset=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=3) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(3);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0009
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0009
     * @tc.desc      TitleExpansionState.didScroll(yOffset=10) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0009 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(10);
      logInfo(`didScroll(yOffset=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=10) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(10);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0010
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0010
     * @tc.desc      TitleExpansionState.didScroll(yOffset=5) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0010 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(5);
      logInfo(`didScroll(yOffset=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=5) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(5);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0011
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0011
     * @tc.desc      TitleExpansionState.didScroll(yOffset=15) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0011 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(15);
      logInfo(`didScroll(yOffset=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=15) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(15);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0012
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0012
     * @tc.desc      TitleExpansionState.didScroll(yOffset=20) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0012 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(20);
      logInfo(`didScroll(yOffset=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=20) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(20);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0013
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0013
     * @tc.desc      TitleExpansionState.didScroll(yOffset=25) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0013 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(25);
      logInfo(`didScroll(yOffset=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=25) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(25);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0014
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0014
     * @tc.desc      TitleExpansionState.didScroll(yOffset=30) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0014 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(30);
      logInfo(`didScroll(yOffset=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=30) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(30);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0015
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0015
     * @tc.desc      TitleExpansionState.didScroll(yOffset=35) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0015 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(35);
      logInfo(`didScroll(yOffset=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=35) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(35);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0016
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0016
     * @tc.desc      TitleExpansionState.didScroll(yOffset=40) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0016 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(40);
      logInfo(`didScroll(yOffset=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=40) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(40);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0017
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0017
     * @tc.desc      TitleExpansionState.didScroll(yOffset=45) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0017 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(45);
      logInfo(`didScroll(yOffset=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=45) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(45);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0018
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0018
     * @tc.desc      TitleExpansionState.didScroll(yOffset=55) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0018 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(55);
      logInfo(`didScroll(yOffset=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=55) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(55);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0019
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0019
     * @tc.desc      TitleExpansionState.didScroll(yOffset=60) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0019 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(60);
      logInfo(`didScroll(yOffset=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=60) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(60);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0020
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0020
     * @tc.desc      TitleExpansionState.didScroll(yOffset=65) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0020 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(65);
      logInfo(`didScroll(yOffset=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=65) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(65);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0021
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0021
     * @tc.desc      TitleExpansionState.didScroll(yOffset=70) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0021 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(70);
      logInfo(`didScroll(yOffset=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=70) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(70);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0022
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0022
     * @tc.desc      TitleExpansionState.didScroll(yOffset=75) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0022 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(75);
      logInfo(`didScroll(yOffset=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=75) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(75);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0023
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0023
     * @tc.desc      TitleExpansionState.didScroll(yOffset=80) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0023 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(80);
      logInfo(`didScroll(yOffset=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=80) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(80);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0024
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0024
     * @tc.desc      TitleExpansionState.didScroll(yOffset=85) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0024 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(85);
      logInfo(`didScroll(yOffset=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=85) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(85);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0025
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0025
     * @tc.desc      TitleExpansionState.didScroll(yOffset=90) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0025 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(90);
      logInfo(`didScroll(yOffset=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=90) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(90);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0026
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0026
     * @tc.desc      TitleExpansionState.didScroll(yOffset=95) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0026 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(95);
      logInfo(`didScroll(yOffset=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=95) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(95);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0027
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0027
     * @tc.desc      TitleExpansionState.didScroll(yOffset=105) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0027 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(105);
      logInfo(`didScroll(yOffset=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=105) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(105);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0028
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0028
     * @tc.desc      TitleExpansionState.didScroll(yOffset=110) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0028 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(110);
      logInfo(`didScroll(yOffset=110): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=110) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(110);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0029
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0029
     * @tc.desc      TitleExpansionState.didScroll(yOffset=115) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0029 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(115);
      logInfo(`didScroll(yOffset=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=115) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(115);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0030
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0030
     * @tc.desc      TitleExpansionState.didScroll(yOffset=120) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0030 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(120);
      logInfo(`didScroll(yOffset=120): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=120) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(120);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0031
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0031
     * @tc.desc      TitleExpansionState.didScroll(yOffset=125) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0031 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(125);
      logInfo(`didScroll(yOffset=125): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=125) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(125);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0032
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0032
     * @tc.desc      TitleExpansionState.didScroll(yOffset=130) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0032 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(130);
      logInfo(`didScroll(yOffset=130): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=130) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(130);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0033
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0033
     * @tc.desc      TitleExpansionState.didScroll(yOffset=135) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0033 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(135);
      logInfo(`didScroll(yOffset=135): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=135) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(135);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0034
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0034
     * @tc.desc      TitleExpansionState.didScroll(yOffset=140) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0034 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(140);
      logInfo(`didScroll(yOffset=140): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=140) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(140);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0035
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0035
     * @tc.desc      TitleExpansionState.didScroll(yOffset=145) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0035 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(145);
      logInfo(`didScroll(yOffset=145): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=145) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(145);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0036
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0036
     * @tc.desc      TitleExpansionState.didScroll(yOffset=150) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0036 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(150);
      logInfo(`didScroll(yOffset=150): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=150) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(150);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0037
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0037
     * @tc.desc      TitleExpansionState.didScroll(yOffset=155) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0037 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(155);
      logInfo(`didScroll(yOffset=155): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=155) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(155);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0038
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0038
     * @tc.desc      TitleExpansionState.didScroll(yOffset=160) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0038 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(160);
      logInfo(`didScroll(yOffset=160): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=160) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(160);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0039
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0039
     * @tc.desc      TitleExpansionState.didScroll(yOffset=165) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0039 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(165);
      logInfo(`didScroll(yOffset=165): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=165) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(165);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0040
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0040
     * @tc.desc      TitleExpansionState.didScroll(yOffset=170) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0040 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(170);
      logInfo(`didScroll(yOffset=170): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=170) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(170);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0041
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0041
     * @tc.desc      TitleExpansionState.didScroll(yOffset=175) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0041 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(175);
      logInfo(`didScroll(yOffset=175): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=175) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(175);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0042
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0042
     * @tc.desc      TitleExpansionState.didScroll(yOffset=180) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0042 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(180);
      logInfo(`didScroll(yOffset=180): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=180) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(180);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0043
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0043
     * @tc.desc      TitleExpansionState.didScroll(yOffset=185) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0043 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(185);
      logInfo(`didScroll(yOffset=185): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=185) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(185);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0044
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0044
     * @tc.desc      TitleExpansionState.didScroll(yOffset=190) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0044 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(190);
      logInfo(`didScroll(yOffset=190): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=190) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(190);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0045
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0045
     * @tc.desc      TitleExpansionState.didScroll(yOffset=195) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0045 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(195);
      logInfo(`didScroll(yOffset=195): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=195) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(195);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0046
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0046
     * @tc.desc      TitleExpansionState.didScroll(yOffset=200) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0046 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(200);
      logInfo(`didScroll(yOffset=200): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=200) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(200);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0047
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0047
     * @tc.desc      TitleExpansionState.didScroll(yOffset=122) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0047 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(122);
      logInfo(`didScroll(yOffset=122): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=122) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(122);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0048
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0048
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-50) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0048 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-50);
      logInfo(`didScroll(yOffset=-50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`didScroll(yOffset=-50) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-50);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0049
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0049
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-45) yields 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0049 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-45);
      logInfo(`didScroll(yOffset=-45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`didScroll(yOffset=-45) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-45);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0050
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0050
     * @tc.desc      TitleExpansionState.didScroll(yOffset=86) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0050 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(86);
      logInfo(`didScroll(yOffset=86): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=86) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(86);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0051
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0051
     * @tc.desc      TitleExpansionState.didScroll(yOffset=148) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0051 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(148);
      logInfo(`didScroll(yOffset=148): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=148) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(148);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0052
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0052
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-16) yields 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0052 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-16);
      logInfo(`didScroll(yOffset=-16): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`didScroll(yOffset=-16) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-16);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0053
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0053
     * @tc.desc      TitleExpansionState.didScroll(yOffset=136) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0053 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(136);
      logInfo(`didScroll(yOffset=136): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=136) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(136);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0054
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0054
     * @tc.desc      TitleExpansionState.didScroll(yOffset=55.84) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0054 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(55.84);
      logInfo(`didScroll(yOffset=55.84): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=55.84) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(55.84, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0055
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0055
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0055 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-2);
      logInfo(`didScroll(yOffset=-2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`didScroll(yOffset=-2) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-2);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0056
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0056
     * @tc.desc      TitleExpansionState.didScroll(yOffset=39) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0056 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(39);
      logInfo(`didScroll(yOffset=39): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=39) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(39);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0057
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0057
     * @tc.desc      TitleExpansionState.didScroll(yOffset=46) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0057 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(46);
      logInfo(`didScroll(yOffset=46): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=46) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(46);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0058
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0058
     * @tc.desc      TitleExpansionState.didScroll(yOffset=51.13) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0058 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(51.13);
      logInfo(`didScroll(yOffset=51.13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=51.13) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(51.13, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0059
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0059
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-37) yields 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0059 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-37);
      logInfo(`didScroll(yOffset=-37): actual=${actual}`);
      expect(actual).assertEqual(37);
      logInfo(`didScroll(yOffset=-37) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-37);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0060
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0060
     * @tc.desc      TitleExpansionState.didScroll(yOffset=72) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0060 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(72);
      logInfo(`didScroll(yOffset=72): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=72) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(72);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0061
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0061
     * @tc.desc      TitleExpansionState.didScroll(yOffset=32) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0061 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(32);
      logInfo(`didScroll(yOffset=32): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=32) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(32);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0062
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0062
     * @tc.desc      TitleExpansionState.didScroll(yOffset=98) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0062 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(98);
      logInfo(`didScroll(yOffset=98): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=98) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(98);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0063
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0063
     * @tc.desc      TitleExpansionState.didScroll(yOffset=17) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0063 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(17);
      logInfo(`didScroll(yOffset=17): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=17) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(17);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0064
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0064
     * @tc.desc      TitleExpansionState.didScroll(yOffset=75.55) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0064 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(75.55);
      logInfo(`didScroll(yOffset=75.55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=75.55) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(75.55, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0065
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0065
     * @tc.desc      TitleExpansionState.didScroll(yOffset=134) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0065 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(134);
      logInfo(`didScroll(yOffset=134): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=134) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(134);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0066
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0066
     * @tc.desc      TitleExpansionState.didScroll(yOffset=75.69) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0066 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(75.69);
      logInfo(`didScroll(yOffset=75.69): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=75.69) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(75.69, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0067
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0067
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-95) yields 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0067 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-95);
      logInfo(`didScroll(yOffset=-95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`didScroll(yOffset=-95) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-95);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0068
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0068
     * @tc.desc      TitleExpansionState.didScroll(yOffset=93) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0068 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(93);
      logInfo(`didScroll(yOffset=93): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=93) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(93);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0069
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0069
     * @tc.desc      TitleExpansionState.didScroll(yOffset=65.78) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0069 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(65.78);
      logInfo(`didScroll(yOffset=65.78): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=65.78) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(65.78, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0070
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0070
     * @tc.desc      TitleExpansionState.didScroll(yOffset=32.79) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0070 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(32.79);
      logInfo(`didScroll(yOffset=32.79): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=32.79) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(32.79, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0071
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0071
     * @tc.desc      TitleExpansionState.didScroll(yOffset=93.38) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0071 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(93.38);
      logInfo(`didScroll(yOffset=93.38): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=93.38) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(93.38, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0072
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0072
     * @tc.desc      TitleExpansionState.didScroll(yOffset=137) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0072 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(137);
      logInfo(`didScroll(yOffset=137): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=137) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(137);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0073
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0073
     * @tc.desc      TitleExpansionState.didScroll(yOffset=-48) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0073 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(-48);
      logInfo(`didScroll(yOffset=-48): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`didScroll(yOffset=-48) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(-48);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0074
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0074
     * @tc.desc      TitleExpansionState.didScroll(yOffset=198) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0074 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(198);
      logInfo(`didScroll(yOffset=198): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=198) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(198);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0075
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0075
     * @tc.desc      TitleExpansionState.didScroll(yOffset=37.27) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0075 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(37.27);
      logInfo(`didScroll(yOffset=37.27): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=37.27) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(37.27, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0076
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0076
     * @tc.desc      TitleExpansionState.didScroll(yOffset=84) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0076 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(84);
      logInfo(`didScroll(yOffset=84): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=84) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(84);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0077
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0077
     * @tc.desc      TitleExpansionState.didScroll(yOffset=147) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0077 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(147);
      logInfo(`didScroll(yOffset=147): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=147) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(147);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0078
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0078
     * @tc.desc      TitleExpansionState.didScroll(yOffset=143) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0078 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(143);
      logInfo(`didScroll(yOffset=143): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=143) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(143);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0079
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0079
     * @tc.desc      TitleExpansionState.didScroll(yOffset=70.28) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0079 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(70.28);
      logInfo(`didScroll(yOffset=70.28): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=70.28) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(70.28, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0080
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0080
     * @tc.desc      TitleExpansionState.didScroll(yOffset=57.99) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0080 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(57.99);
      logInfo(`didScroll(yOffset=57.99): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=57.99) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertClose(57.99, PRECISION);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_DID_SCROLL_0081
     * @tc.name      ExpandTitle_TitleExpansionStateDidScroll_0081
     * @tc.desc      TitleExpansionState.didScroll(yOffset=54) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleExpansionStateDidScroll_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0081 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      const actual: number = subject.didScroll(54);
      logInfo(`didScroll(yOffset=54): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`didScroll(yOffset=54) state: subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(54);
      logInfo(`${BUNDLE}TitleExpansionStateDidScroll_0081 end`);
    });
  });
}
