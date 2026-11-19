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
export default function foldLayoutStatePush2Test(): void {
  describe('FoldLayoutStatePush2Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0062
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0062
     * @tc.desc      FoldLayoutState.push(route="SsA") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0062 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('SsA');
      logInfo(`push(route="SsA"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="SsA") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="SsA") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="SsA") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('SsA');
      logInfo(`push(route="SsA") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('SsA');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0063
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0063
     * @tc.desc      FoldLayoutState.push(route="CI9bhwEXM") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0063 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('CI9bhwEXM');
      logInfo(`push(route="CI9bhwEXM"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="CI9bhwEXM") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="CI9bhwEXM") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="CI9bhwEXM") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CI9bhwEXM');
      logInfo(`push(route="CI9bhwEXM") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CI9bhwEXM');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0064
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0064
     * @tc.desc      FoldLayoutState.push(route="Z4vDoy5") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0064 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Z4vDoy5');
      logInfo(`push(route="Z4vDoy5"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Z4vDoy5") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Z4vDoy5") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Z4vDoy5") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Z4vDoy5');
      logInfo(`push(route="Z4vDoy5") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Z4vDoy5');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0065
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0065
     * @tc.desc      FoldLayoutState.push(route="Ogz") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0065 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Ogz');
      logInfo(`push(route="Ogz"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Ogz") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Ogz") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Ogz") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Ogz');
      logInfo(`push(route="Ogz") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Ogz');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0066
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0066
     * @tc.desc      FoldLayoutState.push(route="ClKjbpd") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0066 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('ClKjbpd');
      logInfo(`push(route="ClKjbpd"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="ClKjbpd") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="ClKjbpd") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="ClKjbpd") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ClKjbpd');
      logInfo(`push(route="ClKjbpd") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ClKjbpd');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0067
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0067
     * @tc.desc      FoldLayoutState.push(route="K6BUwB") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0067 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('K6BUwB');
      logInfo(`push(route="K6BUwB"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="K6BUwB") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="K6BUwB") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="K6BUwB") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('K6BUwB');
      logInfo(`push(route="K6BUwB") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('K6BUwB');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0068
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0068
     * @tc.desc      FoldLayoutState.push(route="QBy") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0068 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('QBy');
      logInfo(`push(route="QBy"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="QBy") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="QBy") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="QBy") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QBy');
      logInfo(`push(route="QBy") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QBy');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0069
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0069
     * @tc.desc      FoldLayoutState.push(route="43Dkt9") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0069 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('43Dkt9');
      logInfo(`push(route="43Dkt9"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="43Dkt9") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="43Dkt9") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="43Dkt9") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('43Dkt9');
      logInfo(`push(route="43Dkt9") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('43Dkt9');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0070
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0070
     * @tc.desc      FoldLayoutState.push(route="9Wc2oBe2nx") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0070 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('9Wc2oBe2nx');
      logInfo(`push(route="9Wc2oBe2nx"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="9Wc2oBe2nx") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="9Wc2oBe2nx") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="9Wc2oBe2nx") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9Wc2oBe2nx');
      logInfo(`push(route="9Wc2oBe2nx") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9Wc2oBe2nx');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0071
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0071
     * @tc.desc      FoldLayoutState.push(route="sGb") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0071 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('sGb');
      logInfo(`push(route="sGb"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="sGb") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="sGb") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="sGb") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sGb');
      logInfo(`push(route="sGb") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sGb');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0072
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0072
     * @tc.desc      FoldLayoutState.push(route="RryHPn0") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0072 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('RryHPn0');
      logInfo(`push(route="RryHPn0"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="RryHPn0") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="RryHPn0") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="RryHPn0") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('RryHPn0');
      logInfo(`push(route="RryHPn0") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('RryHPn0');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0073
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0073
     * @tc.desc      FoldLayoutState.push(route="J3B0bAN") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0073 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('J3B0bAN');
      logInfo(`push(route="J3B0bAN"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="J3B0bAN") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="J3B0bAN") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="J3B0bAN") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('J3B0bAN');
      logInfo(`push(route="J3B0bAN") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('J3B0bAN');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0074
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0074
     * @tc.desc      FoldLayoutState.push(route="zp") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0074 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('zp');
      logInfo(`push(route="zp"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="zp") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="zp") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="zp") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('zp');
      logInfo(`push(route="zp") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('zp');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0075
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0075
     * @tc.desc      FoldLayoutState.push(route="mQAHnIEj") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0075 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('mQAHnIEj');
      logInfo(`push(route="mQAHnIEj"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="mQAHnIEj") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="mQAHnIEj") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="mQAHnIEj") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mQAHnIEj');
      logInfo(`push(route="mQAHnIEj") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mQAHnIEj');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0075 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0076
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0076
     * @tc.desc      FoldLayoutState.push(route="yK") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0076 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('yK');
      logInfo(`push(route="yK"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="yK") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="yK") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="yK") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('yK');
      logInfo(`push(route="yK") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('yK');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0076 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0077
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0077
     * @tc.desc      FoldLayoutState.push(route="5lJ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0077 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('5lJ');
      logInfo(`push(route="5lJ"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="5lJ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="5lJ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="5lJ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('5lJ');
      logInfo(`push(route="5lJ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('5lJ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0077 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0078
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0078
     * @tc.desc      FoldLayoutState.push(route="zrixuUyU") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0078 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('zrixuUyU');
      logInfo(`push(route="zrixuUyU"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="zrixuUyU") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="zrixuUyU") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="zrixuUyU") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('zrixuUyU');
      logInfo(`push(route="zrixuUyU") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('zrixuUyU');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0078 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0079
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0079
     * @tc.desc      FoldLayoutState.push(route="sD2I") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0079 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('sD2I');
      logInfo(`push(route="sD2I"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="sD2I") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="sD2I") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="sD2I") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sD2I');
      logInfo(`push(route="sD2I") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sD2I');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0079 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0080
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0080
     * @tc.desc      FoldLayoutState.push(route="sb") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0080 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('sb');
      logInfo(`push(route="sb"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="sb") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="sb") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="sb") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sb');
      logInfo(`push(route="sb") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sb');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0080 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0081
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0081
     * @tc.desc      FoldLayoutState.push(route="luaI") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0081 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('luaI');
      logInfo(`push(route="luaI"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="luaI") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="luaI") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="luaI") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('luaI');
      logInfo(`push(route="luaI") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('luaI');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0081 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0082
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0082
     * @tc.desc      FoldLayoutState.push(route="ZQqNgSwkhzgH") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0082 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('ZQqNgSwkhzgH');
      logInfo(`push(route="ZQqNgSwkhzgH"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="ZQqNgSwkhzgH") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="ZQqNgSwkhzgH") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="ZQqNgSwkhzgH") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ZQqNgSwkhzgH');
      logInfo(`push(route="ZQqNgSwkhzgH") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ZQqNgSwkhzgH');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0082 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0083
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0083
     * @tc.desc      FoldLayoutState.push(route="nFUhCnCae") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0083 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('nFUhCnCae');
      logInfo(`push(route="nFUhCnCae"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="nFUhCnCae") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="nFUhCnCae") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="nFUhCnCae") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('nFUhCnCae');
      logInfo(`push(route="nFUhCnCae") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('nFUhCnCae');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0083 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0084
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0084
     * @tc.desc      FoldLayoutState.push(route="3eGu6S2yD") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0084 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('3eGu6S2yD');
      logInfo(`push(route="3eGu6S2yD"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="3eGu6S2yD") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="3eGu6S2yD") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="3eGu6S2yD") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('3eGu6S2yD');
      logInfo(`push(route="3eGu6S2yD") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('3eGu6S2yD');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0084 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0085
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0085
     * @tc.desc      FoldLayoutState.push(route="U3mw2rw") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0085 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('U3mw2rw');
      logInfo(`push(route="U3mw2rw"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="U3mw2rw") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="U3mw2rw") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="U3mw2rw") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('U3mw2rw');
      logInfo(`push(route="U3mw2rw") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('U3mw2rw');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0085 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0086
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0086
     * @tc.desc      FoldLayoutState.push(route="4GfSqEf6wuR") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0086 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('4GfSqEf6wuR');
      logInfo(`push(route="4GfSqEf6wuR"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="4GfSqEf6wuR") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="4GfSqEf6wuR") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="4GfSqEf6wuR") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4GfSqEf6wuR');
      logInfo(`push(route="4GfSqEf6wuR") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4GfSqEf6wuR');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0086 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0087
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0087
     * @tc.desc      FoldLayoutState.push(route="mFj") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0087 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('mFj');
      logInfo(`push(route="mFj"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="mFj") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="mFj") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="mFj") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mFj');
      logInfo(`push(route="mFj") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mFj');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0087 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0088
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0088
     * @tc.desc      FoldLayoutState.push(route="YS9Ja") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0088 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('YS9Ja');
      logInfo(`push(route="YS9Ja"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="YS9Ja") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="YS9Ja") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="YS9Ja") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YS9Ja');
      logInfo(`push(route="YS9Ja") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YS9Ja');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0088 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0089
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0089
     * @tc.desc      FoldLayoutState.push(route="UC5DEF4j") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0089 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('UC5DEF4j');
      logInfo(`push(route="UC5DEF4j"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="UC5DEF4j") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="UC5DEF4j") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="UC5DEF4j") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('UC5DEF4j');
      logInfo(`push(route="UC5DEF4j") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('UC5DEF4j');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0089 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0090
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0090
     * @tc.desc      FoldLayoutState.push(route="tpDXECg1oDVa") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0090 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('tpDXECg1oDVa');
      logInfo(`push(route="tpDXECg1oDVa"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="tpDXECg1oDVa") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="tpDXECg1oDVa") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="tpDXECg1oDVa") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tpDXECg1oDVa');
      logInfo(`push(route="tpDXECg1oDVa") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tpDXECg1oDVa');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0090 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0091
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0091
     * @tc.desc      FoldLayoutState.push(route="0O2ydtygn") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0091 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('0O2ydtygn');
      logInfo(`push(route="0O2ydtygn"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="0O2ydtygn") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="0O2ydtygn") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="0O2ydtygn") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('0O2ydtygn');
      logInfo(`push(route="0O2ydtygn") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('0O2ydtygn');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0091 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0092
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0092
     * @tc.desc      FoldLayoutState.push(route="dqt91") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0092 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('dqt91');
      logInfo(`push(route="dqt91"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="dqt91") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="dqt91") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="dqt91") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dqt91');
      logInfo(`push(route="dqt91") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dqt91');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0092 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0093
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0093
     * @tc.desc      FoldLayoutState.push(route="gp6swYZ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0093 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('gp6swYZ');
      logInfo(`push(route="gp6swYZ"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="gp6swYZ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="gp6swYZ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="gp6swYZ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('gp6swYZ');
      logInfo(`push(route="gp6swYZ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('gp6swYZ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0093 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0094
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0094
     * @tc.desc      FoldLayoutState.push(route="UsBf6") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0094 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('UsBf6');
      logInfo(`push(route="UsBf6"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="UsBf6") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="UsBf6") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="UsBf6") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('UsBf6');
      logInfo(`push(route="UsBf6") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('UsBf6');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0094 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0095
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0095
     * @tc.desc      FoldLayoutState.push(route="wTtoDGQ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0095 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('wTtoDGQ');
      logInfo(`push(route="wTtoDGQ"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="wTtoDGQ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="wTtoDGQ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="wTtoDGQ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('wTtoDGQ');
      logInfo(`push(route="wTtoDGQ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('wTtoDGQ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0095 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0096
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0096
     * @tc.desc      FoldLayoutState.push(route="mRh7rDC") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0096 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('mRh7rDC');
      logInfo(`push(route="mRh7rDC"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="mRh7rDC") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="mRh7rDC") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="mRh7rDC") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mRh7rDC');
      logInfo(`push(route="mRh7rDC") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mRh7rDC');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0096 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0097
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0097
     * @tc.desc      FoldLayoutState.push(route="xIX8") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0097 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('xIX8');
      logInfo(`push(route="xIX8"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="xIX8") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="xIX8") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="xIX8") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xIX8');
      logInfo(`push(route="xIX8") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xIX8');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0097 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0098
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0098
     * @tc.desc      FoldLayoutState.push(route="rguyajgqo3wy") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0098 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('rguyajgqo3wy');
      logInfo(`push(route="rguyajgqo3wy"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="rguyajgqo3wy") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="rguyajgqo3wy") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="rguyajgqo3wy") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('rguyajgqo3wy');
      logInfo(`push(route="rguyajgqo3wy") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('rguyajgqo3wy');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0098 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0099
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0099
     * @tc.desc      FoldLayoutState.push(route="tHzc") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0099 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('tHzc');
      logInfo(`push(route="tHzc"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="tHzc") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="tHzc") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="tHzc") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tHzc');
      logInfo(`push(route="tHzc") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tHzc');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0099 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0100
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0100
     * @tc.desc      FoldLayoutState.push(route="XD3RMuwT") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0100 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('XD3RMuwT');
      logInfo(`push(route="XD3RMuwT"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="XD3RMuwT") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="XD3RMuwT") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="XD3RMuwT") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('XD3RMuwT');
      logInfo(`push(route="XD3RMuwT") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('XD3RMuwT');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0100 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0101
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0101
     * @tc.desc      FoldLayoutState.push(route="NsFMQIb") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0101 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('NsFMQIb');
      logInfo(`push(route="NsFMQIb"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="NsFMQIb") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="NsFMQIb") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="NsFMQIb") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('NsFMQIb');
      logInfo(`push(route="NsFMQIb") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('NsFMQIb');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0101 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0102
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0102
     * @tc.desc      FoldLayoutState.push(route="gHL") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0102 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('gHL');
      logInfo(`push(route="gHL"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="gHL") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="gHL") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="gHL") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('gHL');
      logInfo(`push(route="gHL") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('gHL');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0102 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0103
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0103
     * @tc.desc      FoldLayoutState.push(route="Y") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0103 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Y');
      logInfo(`push(route="Y"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Y") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Y") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Y") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Y');
      logInfo(`push(route="Y") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Y');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0103 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0104
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0104
     * @tc.desc      FoldLayoutState.push(route="lcBs") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0104 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('lcBs');
      logInfo(`push(route="lcBs"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="lcBs") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="lcBs") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="lcBs") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('lcBs');
      logInfo(`push(route="lcBs") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('lcBs');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0104 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0105
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0105
     * @tc.desc      FoldLayoutState.push(route="R") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0105 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('R');
      logInfo(`push(route="R"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="R") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="R") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="R") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('R');
      logInfo(`push(route="R") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('R');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0105 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0106
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0106
     * @tc.desc      FoldLayoutState.push(route="wIpNBSRvHA5K") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0106 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('wIpNBSRvHA5K');
      logInfo(`push(route="wIpNBSRvHA5K"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="wIpNBSRvHA5K") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="wIpNBSRvHA5K") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="wIpNBSRvHA5K") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('wIpNBSRvHA5K');
      logInfo(`push(route="wIpNBSRvHA5K") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('wIpNBSRvHA5K');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0106 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0107
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0107
     * @tc.desc      FoldLayoutState.push(route="6W9") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0107 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('6W9');
      logInfo(`push(route="6W9"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="6W9") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="6W9") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="6W9") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('6W9');
      logInfo(`push(route="6W9") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('6W9');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0107 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0108
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0108
     * @tc.desc      FoldLayoutState.push(route="tWI") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0108 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('tWI');
      logInfo(`push(route="tWI"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="tWI") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="tWI") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="tWI") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tWI');
      logInfo(`push(route="tWI") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tWI');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0108 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0109
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0109
     * @tc.desc      FoldLayoutState.push(route="4O") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0109 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('4O');
      logInfo(`push(route="4O"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="4O") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="4O") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="4O") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4O');
      logInfo(`push(route="4O") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4O');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0109 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0110
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0110
     * @tc.desc      FoldLayoutState.push(route="4Q7Zrm0J4JM") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0110 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('4Q7Zrm0J4JM');
      logInfo(`push(route="4Q7Zrm0J4JM"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="4Q7Zrm0J4JM") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="4Q7Zrm0J4JM") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="4Q7Zrm0J4JM") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4Q7Zrm0J4JM');
      logInfo(`push(route="4Q7Zrm0J4JM") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4Q7Zrm0J4JM');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0110 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0111
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0111
     * @tc.desc      FoldLayoutState.push(route="Z") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0111 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Z');
      logInfo(`push(route="Z"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Z") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Z") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Z") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Z');
      logInfo(`push(route="Z") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Z');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0111 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0112
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0112
     * @tc.desc      FoldLayoutState.push(route="uZytFIypEi1j") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0112 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('uZytFIypEi1j');
      logInfo(`push(route="uZytFIypEi1j"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="uZytFIypEi1j") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="uZytFIypEi1j") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="uZytFIypEi1j") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('uZytFIypEi1j');
      logInfo(`push(route="uZytFIypEi1j") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('uZytFIypEi1j');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0112 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0113
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0113
     * @tc.desc      FoldLayoutState.push(route="PoDMfGp") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0113 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('PoDMfGp');
      logInfo(`push(route="PoDMfGp"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="PoDMfGp") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="PoDMfGp") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="PoDMfGp") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('PoDMfGp');
      logInfo(`push(route="PoDMfGp") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('PoDMfGp');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0113 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0114
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0114
     * @tc.desc      FoldLayoutState.push(route="rD6V") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0114 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('rD6V');
      logInfo(`push(route="rD6V"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="rD6V") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="rD6V") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="rD6V") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('rD6V');
      logInfo(`push(route="rD6V") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('rD6V');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0114 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0115
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0115
     * @tc.desc      FoldLayoutState.push(route="Byso2NxFd") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0115 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Byso2NxFd');
      logInfo(`push(route="Byso2NxFd"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Byso2NxFd") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Byso2NxFd") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Byso2NxFd") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Byso2NxFd');
      logInfo(`push(route="Byso2NxFd") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Byso2NxFd');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0115 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0116
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0116
     * @tc.desc      FoldLayoutState.push(route="RmrAVBj") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0116 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('RmrAVBj');
      logInfo(`push(route="RmrAVBj"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="RmrAVBj") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="RmrAVBj") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="RmrAVBj") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('RmrAVBj');
      logInfo(`push(route="RmrAVBj") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('RmrAVBj');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0116 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0117
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0117
     * @tc.desc      FoldLayoutState.push(route="wI") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0117 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('wI');
      logInfo(`push(route="wI"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="wI") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="wI") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="wI") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('wI');
      logInfo(`push(route="wI") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('wI');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0117 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0118
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0118
     * @tc.desc      FoldLayoutState.push(route="dF") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0118 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('dF');
      logInfo(`push(route="dF"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="dF") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="dF") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="dF") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dF');
      logInfo(`push(route="dF") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dF');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0118 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0119
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0119
     * @tc.desc      FoldLayoutState.push(route="VhQmnpFbrF") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0119 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('VhQmnpFbrF');
      logInfo(`push(route="VhQmnpFbrF"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="VhQmnpFbrF") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="VhQmnpFbrF") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="VhQmnpFbrF") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('VhQmnpFbrF');
      logInfo(`push(route="VhQmnpFbrF") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('VhQmnpFbrF');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0119 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0120
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0120
     * @tc.desc      FoldLayoutState.push(route="pD4L2s") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0120 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('pD4L2s');
      logInfo(`push(route="pD4L2s"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="pD4L2s") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="pD4L2s") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="pD4L2s") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('pD4L2s');
      logInfo(`push(route="pD4L2s") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('pD4L2s');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0120 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0121
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0121
     * @tc.desc      FoldLayoutState.push(route="aqNMn") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0121 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('aqNMn');
      logInfo(`push(route="aqNMn"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="aqNMn") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="aqNMn") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="aqNMn") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('aqNMn');
      logInfo(`push(route="aqNMn") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('aqNMn');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0121 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0122
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0122
     * @tc.desc      FoldLayoutState.push(route="dsWQIIpU10A7") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0122 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('dsWQIIpU10A7');
      logInfo(`push(route="dsWQIIpU10A7"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="dsWQIIpU10A7") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="dsWQIIpU10A7") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="dsWQIIpU10A7") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dsWQIIpU10A7');
      logInfo(`push(route="dsWQIIpU10A7") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dsWQIIpU10A7');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0122 end`);
    });
  });
}
