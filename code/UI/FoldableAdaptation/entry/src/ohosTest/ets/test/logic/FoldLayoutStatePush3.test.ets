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

/** Logic checks for FoldLayoutState.push (58 cases). */
export default function foldLayoutStatePush3Test(): void {
  describe('FoldLayoutStatePush3Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0123
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0123
     * @tc.desc      FoldLayoutState.push(route="nKriyYENMO") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0123 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('nKriyYENMO');
      logInfo(`push(route="nKriyYENMO"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="nKriyYENMO") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="nKriyYENMO") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="nKriyYENMO") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('nKriyYENMO');
      logInfo(`push(route="nKriyYENMO") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('nKriyYENMO');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0123 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0124
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0124
     * @tc.desc      FoldLayoutState.push(route="1Af") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0124 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('1Af');
      logInfo(`push(route="1Af"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="1Af") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="1Af") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="1Af") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('1Af');
      logInfo(`push(route="1Af") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('1Af');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0124 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0125
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0125
     * @tc.desc      FoldLayoutState.push(route="VyysdnpG2WsO") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0125 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('VyysdnpG2WsO');
      logInfo(`push(route="VyysdnpG2WsO"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="VyysdnpG2WsO") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="VyysdnpG2WsO") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="VyysdnpG2WsO") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('VyysdnpG2WsO');
      logInfo(`push(route="VyysdnpG2WsO") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('VyysdnpG2WsO');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0125 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0126
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0126
     * @tc.desc      FoldLayoutState.push(route="R5CyIGe") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0126 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('R5CyIGe');
      logInfo(`push(route="R5CyIGe"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="R5CyIGe") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="R5CyIGe") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="R5CyIGe") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('R5CyIGe');
      logInfo(`push(route="R5CyIGe") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('R5CyIGe');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0126 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0127
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0127
     * @tc.desc      FoldLayoutState.push(route="Yt2U6") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0127 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Yt2U6');
      logInfo(`push(route="Yt2U6"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Yt2U6") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Yt2U6") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Yt2U6") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yt2U6');
      logInfo(`push(route="Yt2U6") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yt2U6');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0127 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0128
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0128
     * @tc.desc      FoldLayoutState.push(route="DMGUNUr5X6") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0128 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('DMGUNUr5X6');
      logInfo(`push(route="DMGUNUr5X6"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="DMGUNUr5X6") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="DMGUNUr5X6") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="DMGUNUr5X6") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('DMGUNUr5X6');
      logInfo(`push(route="DMGUNUr5X6") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('DMGUNUr5X6');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0128 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0129
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0129
     * @tc.desc      FoldLayoutState.push(route="qxHlmS") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0129 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('qxHlmS');
      logInfo(`push(route="qxHlmS"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="qxHlmS") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="qxHlmS") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="qxHlmS") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qxHlmS');
      logInfo(`push(route="qxHlmS") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qxHlmS');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0129 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0130
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0130
     * @tc.desc      FoldLayoutState.push(route="iFaP") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0130 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('iFaP');
      logInfo(`push(route="iFaP"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="iFaP") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="iFaP") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="iFaP") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('iFaP');
      logInfo(`push(route="iFaP") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('iFaP');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0130 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0131
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0131
     * @tc.desc      FoldLayoutState.push(route="uyAR92H") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0131 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('uyAR92H');
      logInfo(`push(route="uyAR92H"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="uyAR92H") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="uyAR92H") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="uyAR92H") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('uyAR92H');
      logInfo(`push(route="uyAR92H") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('uyAR92H');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0131 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0132
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0132
     * @tc.desc      FoldLayoutState.push(route="YHJP3jG") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0132 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('YHJP3jG');
      logInfo(`push(route="YHJP3jG"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="YHJP3jG") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="YHJP3jG") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="YHJP3jG") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YHJP3jG');
      logInfo(`push(route="YHJP3jG") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YHJP3jG');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0132 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0133
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0133
     * @tc.desc      FoldLayoutState.push(route="sTCHk") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0133 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('sTCHk');
      logInfo(`push(route="sTCHk"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="sTCHk") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="sTCHk") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="sTCHk") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sTCHk');
      logInfo(`push(route="sTCHk") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sTCHk');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0133 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0134
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0134
     * @tc.desc      FoldLayoutState.push(route="8MSq17COqw") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0134 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('8MSq17COqw');
      logInfo(`push(route="8MSq17COqw"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="8MSq17COqw") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="8MSq17COqw") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="8MSq17COqw") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('8MSq17COqw');
      logInfo(`push(route="8MSq17COqw") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('8MSq17COqw');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0134 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0135
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0135
     * @tc.desc      FoldLayoutState.push(route="Yef3X") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0135 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Yef3X');
      logInfo(`push(route="Yef3X"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Yef3X") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Yef3X") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Yef3X") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yef3X');
      logInfo(`push(route="Yef3X") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yef3X');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0135 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0136
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0136
     * @tc.desc      FoldLayoutState.push(route="9QogxUHO") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0136 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('9QogxUHO');
      logInfo(`push(route="9QogxUHO"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="9QogxUHO") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="9QogxUHO") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="9QogxUHO") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9QogxUHO');
      logInfo(`push(route="9QogxUHO") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9QogxUHO');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0136 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0137
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0137
     * @tc.desc      FoldLayoutState.push(route="RuomdZQ75zH8") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0137 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('RuomdZQ75zH8');
      logInfo(`push(route="RuomdZQ75zH8"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="RuomdZQ75zH8") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="RuomdZQ75zH8") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="RuomdZQ75zH8") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('RuomdZQ75zH8');
      logInfo(`push(route="RuomdZQ75zH8") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('RuomdZQ75zH8');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0137 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0138
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0138
     * @tc.desc      FoldLayoutState.push(route="oH3I6lc6") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0138 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('oH3I6lc6');
      logInfo(`push(route="oH3I6lc6"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="oH3I6lc6") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="oH3I6lc6") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="oH3I6lc6") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('oH3I6lc6');
      logInfo(`push(route="oH3I6lc6") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('oH3I6lc6');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0138 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0139
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0139
     * @tc.desc      FoldLayoutState.push(route="HGlC7") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0139 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('HGlC7');
      logInfo(`push(route="HGlC7"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="HGlC7") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="HGlC7") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="HGlC7") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('HGlC7');
      logInfo(`push(route="HGlC7") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('HGlC7');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0139 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0140
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0140
     * @tc.desc      FoldLayoutState.push(route="EURv") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0140 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('EURv');
      logInfo(`push(route="EURv"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="EURv") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="EURv") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="EURv") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('EURv');
      logInfo(`push(route="EURv") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('EURv');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0140 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0141
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0141
     * @tc.desc      FoldLayoutState.push(route="WWLw0aL79puH") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0141 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('WWLw0aL79puH');
      logInfo(`push(route="WWLw0aL79puH"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="WWLw0aL79puH") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="WWLw0aL79puH") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="WWLw0aL79puH") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('WWLw0aL79puH');
      logInfo(`push(route="WWLw0aL79puH") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('WWLw0aL79puH');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0141 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0142
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0142
     * @tc.desc      FoldLayoutState.push(route="h0qFiCDbj") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0142 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('h0qFiCDbj');
      logInfo(`push(route="h0qFiCDbj"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="h0qFiCDbj") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="h0qFiCDbj") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="h0qFiCDbj") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('h0qFiCDbj');
      logInfo(`push(route="h0qFiCDbj") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('h0qFiCDbj');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0142 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0143
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0143
     * @tc.desc      FoldLayoutState.push(route="2MtjEnIZ1MzG") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0143 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('2MtjEnIZ1MzG');
      logInfo(`push(route="2MtjEnIZ1MzG"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="2MtjEnIZ1MzG") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="2MtjEnIZ1MzG") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="2MtjEnIZ1MzG") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('2MtjEnIZ1MzG');
      logInfo(`push(route="2MtjEnIZ1MzG") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('2MtjEnIZ1MzG');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0143 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0144
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0144
     * @tc.desc      FoldLayoutState.push(route="N9S") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0144 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('N9S');
      logInfo(`push(route="N9S"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="N9S") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="N9S") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="N9S") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('N9S');
      logInfo(`push(route="N9S") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('N9S');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0144 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0145
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0145
     * @tc.desc      FoldLayoutState.push(route="jQoCKzFT") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0145 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('jQoCKzFT');
      logInfo(`push(route="jQoCKzFT"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="jQoCKzFT") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="jQoCKzFT") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="jQoCKzFT") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('jQoCKzFT');
      logInfo(`push(route="jQoCKzFT") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('jQoCKzFT');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0145 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0146
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0146
     * @tc.desc      FoldLayoutState.push(route="4") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0146 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('4');
      logInfo(`push(route="4"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="4") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="4") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="4") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4');
      logInfo(`push(route="4") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0146 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0147
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0147
     * @tc.desc      FoldLayoutState.push(route="GXwk") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0147 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('GXwk');
      logInfo(`push(route="GXwk"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="GXwk") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="GXwk") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="GXwk") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('GXwk');
      logInfo(`push(route="GXwk") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('GXwk');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0147 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0148
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0148
     * @tc.desc      FoldLayoutState.push(route="SjtxzP") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0148 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('SjtxzP');
      logInfo(`push(route="SjtxzP"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="SjtxzP") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="SjtxzP") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="SjtxzP") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('SjtxzP');
      logInfo(`push(route="SjtxzP") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('SjtxzP');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0148 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0149
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0149
     * @tc.desc      FoldLayoutState.push(route="YBG6earU") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0149 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('YBG6earU');
      logInfo(`push(route="YBG6earU"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="YBG6earU") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="YBG6earU") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="YBG6earU") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YBG6earU');
      logInfo(`push(route="YBG6earU") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YBG6earU');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0149 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0150
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0150
     * @tc.desc      FoldLayoutState.push(route="9DG9") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0150 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('9DG9');
      logInfo(`push(route="9DG9"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="9DG9") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="9DG9") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="9DG9") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9DG9');
      logInfo(`push(route="9DG9") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9DG9');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0150 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0151
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0151
     * @tc.desc      FoldLayoutState.push(route="05") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0151 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('05');
      logInfo(`push(route="05"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="05") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="05") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="05") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('05');
      logInfo(`push(route="05") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('05');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0151 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0152
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0152
     * @tc.desc      FoldLayoutState.push(route="sX8IIO6eY") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0152 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('sX8IIO6eY');
      logInfo(`push(route="sX8IIO6eY"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="sX8IIO6eY") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="sX8IIO6eY") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="sX8IIO6eY") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sX8IIO6eY');
      logInfo(`push(route="sX8IIO6eY") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sX8IIO6eY');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0152 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0153
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0153
     * @tc.desc      FoldLayoutState.push(route="xF5mtRgAe") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0153 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('xF5mtRgAe');
      logInfo(`push(route="xF5mtRgAe"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="xF5mtRgAe") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="xF5mtRgAe") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="xF5mtRgAe") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xF5mtRgAe');
      logInfo(`push(route="xF5mtRgAe") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xF5mtRgAe');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0153 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0154
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0154
     * @tc.desc      FoldLayoutState.push(route="l") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0154 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('l');
      logInfo(`push(route="l"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="l") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="l") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="l") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('l');
      logInfo(`push(route="l") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('l');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0154 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0155
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0155
     * @tc.desc      FoldLayoutState.push(route="OwcYyBxztK") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0155 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('OwcYyBxztK');
      logInfo(`push(route="OwcYyBxztK"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="OwcYyBxztK") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="OwcYyBxztK") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="OwcYyBxztK") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('OwcYyBxztK');
      logInfo(`push(route="OwcYyBxztK") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('OwcYyBxztK');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0155 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0156
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0156
     * @tc.desc      FoldLayoutState.push(route="c") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0156 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('c');
      logInfo(`push(route="c"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="c") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="c") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="c") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('c');
      logInfo(`push(route="c") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('c');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0156 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0157
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0157
     * @tc.desc      FoldLayoutState.push(route="W73nlYj0Yns") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0157 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('W73nlYj0Yns');
      logInfo(`push(route="W73nlYj0Yns"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="W73nlYj0Yns") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="W73nlYj0Yns") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="W73nlYj0Yns") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('W73nlYj0Yns');
      logInfo(`push(route="W73nlYj0Yns") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('W73nlYj0Yns');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0157 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0158
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0158
     * @tc.desc      FoldLayoutState.push(route="EB3x5Oew") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0158 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('EB3x5Oew');
      logInfo(`push(route="EB3x5Oew"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="EB3x5Oew") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="EB3x5Oew") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="EB3x5Oew") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('EB3x5Oew');
      logInfo(`push(route="EB3x5Oew") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('EB3x5Oew');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0158 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0159
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0159
     * @tc.desc      FoldLayoutState.push(route="qSLy") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0159 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('qSLy');
      logInfo(`push(route="qSLy"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="qSLy") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="qSLy") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="qSLy") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qSLy');
      logInfo(`push(route="qSLy") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qSLy');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0159 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0160
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0160
     * @tc.desc      FoldLayoutState.push(route="kBXEt17y5") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0160 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('kBXEt17y5');
      logInfo(`push(route="kBXEt17y5"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="kBXEt17y5") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="kBXEt17y5") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="kBXEt17y5") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('kBXEt17y5');
      logInfo(`push(route="kBXEt17y5") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('kBXEt17y5');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0160 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0161
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0161
     * @tc.desc      FoldLayoutState.push(route="I9UN1cxnnrd") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0161 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('I9UN1cxnnrd');
      logInfo(`push(route="I9UN1cxnnrd"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="I9UN1cxnnrd") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="I9UN1cxnnrd") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="I9UN1cxnnrd") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('I9UN1cxnnrd');
      logInfo(`push(route="I9UN1cxnnrd") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('I9UN1cxnnrd');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0161 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0162
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0162
     * @tc.desc      FoldLayoutState.push(route="Y5EuigHue1") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0162 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Y5EuigHue1');
      logInfo(`push(route="Y5EuigHue1"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Y5EuigHue1") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Y5EuigHue1") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Y5EuigHue1") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Y5EuigHue1');
      logInfo(`push(route="Y5EuigHue1") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Y5EuigHue1');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0162 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0163
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0163
     * @tc.desc      FoldLayoutState.push(route="OCQv0K2gECA") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0163 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('OCQv0K2gECA');
      logInfo(`push(route="OCQv0K2gECA"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="OCQv0K2gECA") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="OCQv0K2gECA") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="OCQv0K2gECA") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('OCQv0K2gECA');
      logInfo(`push(route="OCQv0K2gECA") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('OCQv0K2gECA');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0163 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0164
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0164
     * @tc.desc      FoldLayoutState.push(route="6") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0164 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('6');
      logInfo(`push(route="6"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="6") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="6") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="6") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('6');
      logInfo(`push(route="6") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('6');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0164 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0165
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0165
     * @tc.desc      FoldLayoutState.push(route="PzXCY7UNxdB8") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0165 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('PzXCY7UNxdB8');
      logInfo(`push(route="PzXCY7UNxdB8"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="PzXCY7UNxdB8") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="PzXCY7UNxdB8") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="PzXCY7UNxdB8") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('PzXCY7UNxdB8');
      logInfo(`push(route="PzXCY7UNxdB8") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('PzXCY7UNxdB8');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0165 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0166
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0166
     * @tc.desc      FoldLayoutState.push(route="QWl") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0166 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('QWl');
      logInfo(`push(route="QWl"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="QWl") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="QWl") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="QWl") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QWl');
      logInfo(`push(route="QWl") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QWl');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0166 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0167
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0167
     * @tc.desc      FoldLayoutState.push(route="RtNmV8fr7eoq") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0167 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('RtNmV8fr7eoq');
      logInfo(`push(route="RtNmV8fr7eoq"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="RtNmV8fr7eoq") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="RtNmV8fr7eoq") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="RtNmV8fr7eoq") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('RtNmV8fr7eoq');
      logInfo(`push(route="RtNmV8fr7eoq") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('RtNmV8fr7eoq');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0167 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0168
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0168
     * @tc.desc      FoldLayoutState.push(route="vlnTz") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0168 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('vlnTz');
      logInfo(`push(route="vlnTz"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="vlnTz") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="vlnTz") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="vlnTz") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('vlnTz');
      logInfo(`push(route="vlnTz") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('vlnTz');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0168 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0169
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0169
     * @tc.desc      FoldLayoutState.push(route="CNNTXFFap") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0169 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('CNNTXFFap');
      logInfo(`push(route="CNNTXFFap"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="CNNTXFFap") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="CNNTXFFap") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="CNNTXFFap") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CNNTXFFap');
      logInfo(`push(route="CNNTXFFap") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CNNTXFFap');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0169 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0170
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0170
     * @tc.desc      FoldLayoutState.push(route="WBBuD") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0170 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('WBBuD');
      logInfo(`push(route="WBBuD"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="WBBuD") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="WBBuD") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="WBBuD") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('WBBuD');
      logInfo(`push(route="WBBuD") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('WBBuD');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0170 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0171
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0171
     * @tc.desc      FoldLayoutState.push(route="5jHJZ") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0171 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('5jHJZ');
      logInfo(`push(route="5jHJZ"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="5jHJZ") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="5jHJZ") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="5jHJZ") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('5jHJZ');
      logInfo(`push(route="5jHJZ") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('5jHJZ');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0171 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0172
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0172
     * @tc.desc      FoldLayoutState.push(route="N") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0172 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('N');
      logInfo(`push(route="N"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="N") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="N") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="N") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('N');
      logInfo(`push(route="N") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('N');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0172 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0173
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0173
     * @tc.desc      FoldLayoutState.push(route="CylPH") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0173 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('CylPH');
      logInfo(`push(route="CylPH"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="CylPH") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="CylPH") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="CylPH") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CylPH');
      logInfo(`push(route="CylPH") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CylPH');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0173 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0174
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0174
     * @tc.desc      FoldLayoutState.push(route="Y04PixjyIvmu") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0174 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('Y04PixjyIvmu');
      logInfo(`push(route="Y04PixjyIvmu"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="Y04PixjyIvmu") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="Y04PixjyIvmu") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="Y04PixjyIvmu") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Y04PixjyIvmu');
      logInfo(`push(route="Y04PixjyIvmu") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Y04PixjyIvmu');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0174 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0175
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0175
     * @tc.desc      FoldLayoutState.push(route="HEwnWVlBQqim") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0175 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('HEwnWVlBQqim');
      logInfo(`push(route="HEwnWVlBQqim"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="HEwnWVlBQqim") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="HEwnWVlBQqim") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="HEwnWVlBQqim") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('HEwnWVlBQqim');
      logInfo(`push(route="HEwnWVlBQqim") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('HEwnWVlBQqim');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0175 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0176
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0176
     * @tc.desc      FoldLayoutState.push(route="RyK3kaGb5JT8") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0176 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('RyK3kaGb5JT8');
      logInfo(`push(route="RyK3kaGb5JT8"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="RyK3kaGb5JT8") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="RyK3kaGb5JT8") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="RyK3kaGb5JT8") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('RyK3kaGb5JT8');
      logInfo(`push(route="RyK3kaGb5JT8") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('RyK3kaGb5JT8');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0176 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0177
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0177
     * @tc.desc      FoldLayoutState.push(route="jgH8k") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0177 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('jgH8k');
      logInfo(`push(route="jgH8k"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="jgH8k") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="jgH8k") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="jgH8k") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('jgH8k');
      logInfo(`push(route="jgH8k") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('jgH8k');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0177 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0178
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0178
     * @tc.desc      FoldLayoutState.push(route="10UttR") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0178 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('10UttR');
      logInfo(`push(route="10UttR"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="10UttR") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="10UttR") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="10UttR") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('10UttR');
      logInfo(`push(route="10UttR") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('10UttR');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0178 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0179
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0179
     * @tc.desc      FoldLayoutState.push(route="KBshc") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0179 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('KBshc');
      logInfo(`push(route="KBshc"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="KBshc") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="KBshc") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="KBshc") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('KBshc');
      logInfo(`push(route="KBshc") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('KBshc');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0179 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_PUSH_0180
     * @tc.name      FoldableAdaptation_FoldLayoutStatePush_0180
     * @tc.desc      FoldLayoutState.push(route="pzsVfTEd2") yields "Split"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStatePush_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStatePush_0180 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const actual: string = subject.push('pzsVfTEd2');
      logInfo(`push(route="pzsVfTEd2"): actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`push(route="pzsVfTEd2") state: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push(route="pzsVfTEd2") state: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push(route="pzsVfTEd2") state: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('pzsVfTEd2');
      logInfo(`push(route="pzsVfTEd2") state: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('pzsVfTEd2');
      logInfo(`${BUNDLE}FoldLayoutStatePush_0180 end`);
    });
  });
}
