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

/** Logic checks for FoldLayoutState.push (61 cases). */
export default function foldLayoutStatePushTest(): void {
  describe('FoldLayoutStatePushTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0001
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0001
     * @tc.desc      FoldLayoutState.push(route="pop") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FoldLayoutStatePush_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0001 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('pop');
      logInfo(`push(route="pop"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="pop") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="pop") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="pop") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('pop');
      logInfo(`push(route="pop") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('pop');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0002
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0002
     * @tc.desc      FoldLayoutState.push(route="POP") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FoldLayoutStatePush_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0002 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('POP');
      logInfo(`push(route="POP"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="POP") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="POP") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="POP") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('POP');
      logInfo(`push(route="POP") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('POP');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0003
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0003
     * @tc.desc      FoldLayoutState.push(route="po") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0003 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('po');
      logInfo(`push(route="po"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="po") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="po") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="po") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('po');
      logInfo(`push(route="po") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('po');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0004
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0004
     * @tc.desc      FoldLayoutState.push(route="popx") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0004 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('popx');
      logInfo(`push(route="popx"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="popx") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="popx") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="popx") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('popx');
      logInfo(`push(route="popx") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('popx');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0005
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0005
     * @tc.desc      FoldLayoutState.push(route="") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0005 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('');
      logInfo(`push(route=""): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`${BUNDLE}FoldLayoutStatePush_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0006
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0006
     * @tc.desc      FoldLayoutState.push(route="a") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0006 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('a');
      logInfo(`push(route="a"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="a") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="a") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="a") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('a');
      logInfo(`push(route="a") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('a');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0007
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0007
     * @tc.desc      FoldLayoutState.push(route="abc") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0007 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('abc');
      logInfo(`push(route="abc"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="abc") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="abc") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="abc") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('abc');
      logInfo(`push(route="abc") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('abc');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0008
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0008
     * @tc.desc      FoldLayoutState.push(route="Hello World") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0008 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Hello World');
      logInfo(`push(route="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Hello World") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Hello World") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Hello World") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Hello World');
      logInfo(`push(route="Hello World") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Hello World');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0009
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0009
     * @tc.desc      FoldLayoutState.push(route=" ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0009 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' ');
      logInfo(`push(route=" "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' ');
      logInfo(`push(route=" ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0010
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0010
     * @tc.desc      FoldLayoutState.push(route="123") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0010 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('123');
      logInfo(`push(route="123"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="123") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="123") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="123") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('123');
      logInfo(`push(route="123") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('123');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0011
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0011
     * @tc.desc      FoldLayoutState.push(route=" pop ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0011 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' pop ');
      logInfo(`push(route=" pop "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" pop ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" pop ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" pop ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' pop ');
      logInfo(`push(route=" pop ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' pop ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0012
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0012
     * @tc.desc      FoldLayoutState.push(route="poppop") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0012 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('poppop');
      logInfo(`push(route="poppop"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="poppop") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="poppop") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="poppop") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('poppop');
      logInfo(`push(route="poppop") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('poppop');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0013
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0013
     * @tc.desc      FoldLayoutState.push(route="pop_1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0013 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('pop_1');
      logInfo(`push(route="pop_1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="pop_1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="pop_1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="pop_1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('pop_1');
      logInfo(`push(route="pop_1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('pop_1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0014
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0014
     * @tc.desc      FoldLayoutState.push(route="xpop") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0014 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('xpop');
      logInfo(`push(route="xpop"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="xpop") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="xpop") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="xpop") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xpop');
      logInfo(`push(route="xpop") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xpop');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0015
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0015
     * @tc.desc      FoldLayoutState.push(route=" POP ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0015 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' POP ');
      logInfo(`push(route=" POP "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" POP ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" POP ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" POP ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' POP ');
      logInfo(`push(route=" POP ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' POP ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0016
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0016
     * @tc.desc      FoldLayoutState.push(route="POPPOP") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0016 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('POPPOP');
      logInfo(`push(route="POPPOP"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="POPPOP") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="POPPOP") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="POPPOP") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('POPPOP');
      logInfo(`push(route="POPPOP") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('POPPOP');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0017
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0017
     * @tc.desc      FoldLayoutState.push(route="POP_1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0017 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('POP_1');
      logInfo(`push(route="POP_1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="POP_1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="POP_1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="POP_1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('POP_1');
      logInfo(`push(route="POP_1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('POP_1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0018
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0018
     * @tc.desc      FoldLayoutState.push(route="xPOP") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0018 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('xPOP');
      logInfo(`push(route="xPOP"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="xPOP") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="xPOP") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="xPOP") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xPOP');
      logInfo(`push(route="xPOP") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xPOP');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0019
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0019
     * @tc.desc      FoldLayoutState.push(route=" po ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0019 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' po ');
      logInfo(`push(route=" po "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" po ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" po ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" po ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' po ');
      logInfo(`push(route=" po ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' po ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0020
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0020
     * @tc.desc      FoldLayoutState.push(route="popo") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0020 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('popo');
      logInfo(`push(route="popo"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="popo") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="popo") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="popo") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('popo');
      logInfo(`push(route="popo") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('popo');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0021
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0021
     * @tc.desc      FoldLayoutState.push(route="po_1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0021 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('po_1');
      logInfo(`push(route="po_1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="po_1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="po_1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="po_1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('po_1');
      logInfo(`push(route="po_1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('po_1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0022
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0022
     * @tc.desc      FoldLayoutState.push(route="xpo") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0022 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('xpo');
      logInfo(`push(route="xpo"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="xpo") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="xpo") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="xpo") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xpo');
      logInfo(`push(route="xpo") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xpo');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0023
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0023
     * @tc.desc      FoldLayoutState.push(route=" popx ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0023 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' popx ');
      logInfo(`push(route=" popx "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" popx ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" popx ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" popx ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' popx ');
      logInfo(`push(route=" popx ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' popx ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0024
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0024
     * @tc.desc      FoldLayoutState.push(route="popxpopx") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0024 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('popxpopx');
      logInfo(`push(route="popxpopx"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="popxpopx") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="popxpopx") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="popxpopx") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('popxpopx');
      logInfo(`push(route="popxpopx") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('popxpopx');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0025
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0025
     * @tc.desc      FoldLayoutState.push(route="popx_1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0025 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('popx_1');
      logInfo(`push(route="popx_1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="popx_1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="popx_1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="popx_1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('popx_1');
      logInfo(`push(route="popx_1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('popx_1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0026
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0026
     * @tc.desc      FoldLayoutState.push(route="xpopx") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0026 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('xpopx');
      logInfo(`push(route="xpopx"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="xpopx") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="xpopx") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="xpopx") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xpopx');
      logInfo(`push(route="xpopx") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xpopx');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0027
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0027
     * @tc.desc      FoldLayoutState.push(route=" a ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0027 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' a ');
      logInfo(`push(route=" a "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" a ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" a ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" a ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' a ');
      logInfo(`push(route=" a ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' a ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0028
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0028
     * @tc.desc      FoldLayoutState.push(route="aa") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0028 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('aa');
      logInfo(`push(route="aa"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="aa") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="aa") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="aa") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('aa');
      logInfo(`push(route="aa") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('aa');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0029
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0029
     * @tc.desc      FoldLayoutState.push(route="a_1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0029 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('a_1');
      logInfo(`push(route="a_1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="a_1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="a_1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="a_1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('a_1');
      logInfo(`push(route="a_1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('a_1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0030
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0030
     * @tc.desc      FoldLayoutState.push(route="xa") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0030 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('xa');
      logInfo(`push(route="xa"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="xa") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="xa") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="xa") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xa');
      logInfo(`push(route="xa") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xa');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0031
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0031
     * @tc.desc      FoldLayoutState.push(route=" abc ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0031 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' abc ');
      logInfo(`push(route=" abc "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" abc ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" abc ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" abc ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' abc ');
      logInfo(`push(route=" abc ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' abc ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0032
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0032
     * @tc.desc      FoldLayoutState.push(route="abcabc") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0032 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('abcabc');
      logInfo(`push(route="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="abcabc") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="abcabc") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="abcabc") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('abcabc');
      logInfo(`push(route="abcabc") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('abcabc');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0033
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0033
     * @tc.desc      FoldLayoutState.push(route="abc_1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0033 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('abc_1');
      logInfo(`push(route="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="abc_1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="abc_1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="abc_1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('abc_1');
      logInfo(`push(route="abc_1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('abc_1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0034
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0034
     * @tc.desc      FoldLayoutState.push(route="xabc") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0034 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('xabc');
      logInfo(`push(route="xabc"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="xabc") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="xabc") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="xabc") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xabc');
      logInfo(`push(route="xabc") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xabc');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0035
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0035
     * @tc.desc      FoldLayoutState.push(route=" Hello World ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0035 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' Hello World ');
      logInfo(`push(route=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" Hello World ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" Hello World ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" Hello World ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' Hello World ');
      logInfo(`push(route=" Hello World ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0036
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0036
     * @tc.desc      FoldLayoutState.push(route="Hello WorldHello World") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0036 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Hello WorldHello World');
      logInfo(`push(route="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Hello WorldHello World") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Hello WorldHello World") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Hello WorldHello World") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Hello WorldHello World');
      logInfo(`push(route="Hello WorldHello World") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0037
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0037
     * @tc.desc      FoldLayoutState.push(route="Hello World_1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0037 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Hello World_1');
      logInfo(`push(route="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Hello World_1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Hello World_1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Hello World_1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Hello World_1');
      logInfo(`push(route="Hello World_1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0038
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0038
     * @tc.desc      FoldLayoutState.push(route="xHello World") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0038 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('xHello World');
      logInfo(`push(route="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="xHello World") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="xHello World") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="xHello World") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xHello World');
      logInfo(`push(route="xHello World") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xHello World');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0039
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0039
     * @tc.desc      FoldLayoutState.push(route="   ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0039 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('   ');
      logInfo(`push(route="   "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="   ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="   ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="   ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('   ');
      logInfo(`push(route="   ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('   ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0040
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0040
     * @tc.desc      FoldLayoutState.push(route="  ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0040 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('  ');
      logInfo(`push(route="  "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="  ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="  ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="  ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('  ');
      logInfo(`push(route="  ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('  ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0041
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0041
     * @tc.desc      FoldLayoutState.push(route=" _1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0041 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' _1');
      logInfo(`push(route=" _1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" _1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" _1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" _1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' _1');
      logInfo(`push(route=" _1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' _1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0042
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0042
     * @tc.desc      FoldLayoutState.push(route="x ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0042 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('x ');
      logInfo(`push(route="x "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="x ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="x ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="x ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('x ');
      logInfo(`push(route="x ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('x ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0043
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0043
     * @tc.desc      FoldLayoutState.push(route=" 123 ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0043 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push(' 123 ');
      logInfo(`push(route=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route=" 123 ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route=" 123 ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route=" 123 ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' 123 ');
      logInfo(`push(route=" 123 ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' 123 ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0044
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0044
     * @tc.desc      FoldLayoutState.push(route="123123") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0044 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('123123');
      logInfo(`push(route="123123"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="123123") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="123123") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="123123") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('123123');
      logInfo(`push(route="123123") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('123123');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0045
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0045
     * @tc.desc      FoldLayoutState.push(route="123_1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0045 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('123_1');
      logInfo(`push(route="123_1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="123_1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="123_1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="123_1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('123_1');
      logInfo(`push(route="123_1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('123_1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0046
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0046
     * @tc.desc      FoldLayoutState.push(route="x123") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FoldLayoutStatePush_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0046 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('x123');
      logInfo(`push(route="x123"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="x123") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="x123") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="x123") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('x123');
      logInfo(`push(route="x123") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('x123');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0047
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0047
     * @tc.desc      FoldLayoutState.push(route="VtStKmDP2u") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0047 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('VtStKmDP2u');
      logInfo(`push(route="VtStKmDP2u"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="VtStKmDP2u") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="VtStKmDP2u") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="VtStKmDP2u") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('VtStKmDP2u');
      logInfo(`push(route="VtStKmDP2u") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('VtStKmDP2u');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0048
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0048
     * @tc.desc      FoldLayoutState.push(route="HDWLlwbDkiF") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0048 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('HDWLlwbDkiF');
      logInfo(`push(route="HDWLlwbDkiF"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="HDWLlwbDkiF") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="HDWLlwbDkiF") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="HDWLlwbDkiF") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('HDWLlwbDkiF');
      logInfo(`push(route="HDWLlwbDkiF") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('HDWLlwbDkiF');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0049
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0049
     * @tc.desc      FoldLayoutState.push(route="ji260s") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0049 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('ji260s');
      logInfo(`push(route="ji260s"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="ji260s") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="ji260s") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="ji260s") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ji260s');
      logInfo(`push(route="ji260s") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ji260s');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0050
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0050
     * @tc.desc      FoldLayoutState.push(route="QuD8OSFzUc") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0050 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('QuD8OSFzUc');
      logInfo(`push(route="QuD8OSFzUc"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="QuD8OSFzUc") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="QuD8OSFzUc") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="QuD8OSFzUc") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QuD8OSFzUc');
      logInfo(`push(route="QuD8OSFzUc") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QuD8OSFzUc');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0050 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0051
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0051
     * @tc.desc      FoldLayoutState.push(route="A6XSmSNXcSK") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0051 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('A6XSmSNXcSK');
      logInfo(`push(route="A6XSmSNXcSK"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="A6XSmSNXcSK") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="A6XSmSNXcSK") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="A6XSmSNXcSK") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('A6XSmSNXcSK');
      logInfo(`push(route="A6XSmSNXcSK") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('A6XSmSNXcSK');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0052
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0052
     * @tc.desc      FoldLayoutState.push(route="iRJm14qh130") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0052 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('iRJm14qh130');
      logInfo(`push(route="iRJm14qh130"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="iRJm14qh130") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="iRJm14qh130") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="iRJm14qh130") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('iRJm14qh130');
      logInfo(`push(route="iRJm14qh130") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('iRJm14qh130');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0053
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0053
     * @tc.desc      FoldLayoutState.push(route="5ozgs6M") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0053 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('5ozgs6M');
      logInfo(`push(route="5ozgs6M"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="5ozgs6M") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="5ozgs6M") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="5ozgs6M") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('5ozgs6M');
      logInfo(`push(route="5ozgs6M") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('5ozgs6M');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0054
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0054
     * @tc.desc      FoldLayoutState.push(route="TfYsI") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0054 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('TfYsI');
      logInfo(`push(route="TfYsI"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="TfYsI") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="TfYsI") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="TfYsI") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('TfYsI');
      logInfo(`push(route="TfYsI") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('TfYsI');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0055
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0055
     * @tc.desc      FoldLayoutState.push(route="QoHTDDFDLp") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0055 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('QoHTDDFDLp');
      logInfo(`push(route="QoHTDDFDLp"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="QoHTDDFDLp") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="QoHTDDFDLp") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="QoHTDDFDLp") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QoHTDDFDLp');
      logInfo(`push(route="QoHTDDFDLp") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QoHTDDFDLp');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0056
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0056
     * @tc.desc      FoldLayoutState.push(route="LSyiarJKOkGy") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0056 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('LSyiarJKOkGy');
      logInfo(`push(route="LSyiarJKOkGy"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="LSyiarJKOkGy") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="LSyiarJKOkGy") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="LSyiarJKOkGy") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('LSyiarJKOkGy');
      logInfo(`push(route="LSyiarJKOkGy") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('LSyiarJKOkGy');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0057
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0057
     * @tc.desc      FoldLayoutState.push(route="i") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0057 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('i');
      logInfo(`push(route="i"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="i") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="i") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="i") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('i');
      logInfo(`push(route="i") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('i');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0058
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0058
     * @tc.desc      FoldLayoutState.push(route="qeEC2oAAaz") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0058 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('qeEC2oAAaz');
      logInfo(`push(route="qeEC2oAAaz"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="qeEC2oAAaz") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="qeEC2oAAaz") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="qeEC2oAAaz") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qeEC2oAAaz');
      logInfo(`push(route="qeEC2oAAaz") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qeEC2oAAaz');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0059
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0059
     * @tc.desc      FoldLayoutState.push(route="UPawgHO") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0059 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('UPawgHO');
      logInfo(`push(route="UPawgHO"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="UPawgHO") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="UPawgHO") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="UPawgHO") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('UPawgHO');
      logInfo(`push(route="UPawgHO") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('UPawgHO');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0060
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0060
     * @tc.desc      FoldLayoutState.push(route="Wekqg0YAP") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0060 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Wekqg0YAP');
      logInfo(`push(route="Wekqg0YAP"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Wekqg0YAP") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Wekqg0YAP") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Wekqg0YAP") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Wekqg0YAP');
      logInfo(`push(route="Wekqg0YAP") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Wekqg0YAP');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0061
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0061
     * @tc.desc      FoldLayoutState.push(route="9njw0") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0061 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('9njw0');
      logInfo(`push(route="9njw0"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="9njw0") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="9njw0") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="9njw0") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9njw0');
      logInfo(`push(route="9njw0") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9njw0');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0061 end`);
    });
  });
}
