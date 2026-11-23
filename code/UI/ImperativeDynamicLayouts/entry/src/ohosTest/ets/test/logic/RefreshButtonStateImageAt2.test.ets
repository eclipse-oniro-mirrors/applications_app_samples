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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RefreshButtonState } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for RefreshButtonState.imageAt (85 cases). */
export default function refreshButtonStateImageAt2Test(): void {
  describe('RefreshButtonStateImageAt2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0091
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0091
     * @tc.desc      RefreshButtonState.imageAt(index=182) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0091 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(182);
      logInfo(`imageAt(index=182): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0091 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0092
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0092
     * @tc.desc      RefreshButtonState.imageAt(index=97) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0092 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(97);
      logInfo(`imageAt(index=97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0092 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0093
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0093
     * @tc.desc      RefreshButtonState.imageAt(index=63) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0093 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(63);
      logInfo(`imageAt(index=63): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0093 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0094
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0094
     * @tc.desc      RefreshButtonState.imageAt(index=51) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0094 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(51);
      logInfo(`imageAt(index=51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0094 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0095
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0095
     * @tc.desc      RefreshButtonState.imageAt(index=23.44) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0095 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(23.44);
      logInfo(`imageAt(index=23.44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0095 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0096
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0096
     * @tc.desc      RefreshButtonState.imageAt(index=-73) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0096 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-73);
      logInfo(`imageAt(index=-73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0096 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0097
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0097
     * @tc.desc      RefreshButtonState.imageAt(index=89.44) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0097 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(89.44);
      logInfo(`imageAt(index=89.44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0097 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0098
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0098
     * @tc.desc      RefreshButtonState.imageAt(index=168) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0098 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(168);
      logInfo(`imageAt(index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0098 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0099
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0099
     * @tc.desc      RefreshButtonState.imageAt(index=146) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0099 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(146);
      logInfo(`imageAt(index=146): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0099 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0100
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0100
     * @tc.desc      RefreshButtonState.imageAt(index=99) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0100 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(99);
      logInfo(`imageAt(index=99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0100 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0101
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0101
     * @tc.desc      RefreshButtonState.imageAt(index=69) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0101 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(69);
      logInfo(`imageAt(index=69): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0101 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0102
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0102
     * @tc.desc      RefreshButtonState.imageAt(index=-52) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0102 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-52);
      logInfo(`imageAt(index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0102 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0103
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0103
     * @tc.desc      RefreshButtonState.imageAt(index=8) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0103 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(8);
      logInfo(`imageAt(index=8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0103 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0104
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0104
     * @tc.desc      RefreshButtonState.imageAt(index=21.3) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0104 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(21.3);
      logInfo(`imageAt(index=21.3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0104 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0105
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0105
     * @tc.desc      RefreshButtonState.imageAt(index=-62) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0105 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-62);
      logInfo(`imageAt(index=-62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0105 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0106
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0106
     * @tc.desc      RefreshButtonState.imageAt(index=24) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0106 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(24);
      logInfo(`imageAt(index=24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0106 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0107
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0107
     * @tc.desc      RefreshButtonState.imageAt(index=43) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0107 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(43);
      logInfo(`imageAt(index=43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0107 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0108
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0108
     * @tc.desc      RefreshButtonState.imageAt(index=14.79) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0108 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(14.79);
      logInfo(`imageAt(index=14.79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0108 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0109
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0109
     * @tc.desc      RefreshButtonState.imageAt(index=90.8) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0109 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(90.8);
      logInfo(`imageAt(index=90.8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0109 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0110
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0110
     * @tc.desc      RefreshButtonState.imageAt(index=12.43) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0110 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(12.43);
      logInfo(`imageAt(index=12.43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0110 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0111
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0111
     * @tc.desc      RefreshButtonState.imageAt(index=72.42) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0111 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(72.42);
      logInfo(`imageAt(index=72.42): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0111 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0112
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0112
     * @tc.desc      RefreshButtonState.imageAt(index=144) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0112 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(144);
      logInfo(`imageAt(index=144): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0112 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0113
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0113
     * @tc.desc      RefreshButtonState.imageAt(index=-46) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0113 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-46);
      logInfo(`imageAt(index=-46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0113 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0114
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0114
     * @tc.desc      RefreshButtonState.imageAt(index=65.81) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0114 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(65.81);
      logInfo(`imageAt(index=65.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0114 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0115
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0115
     * @tc.desc      RefreshButtonState.imageAt(index=158) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0115 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(158);
      logInfo(`imageAt(index=158): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0115 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0116
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0116
     * @tc.desc      RefreshButtonState.imageAt(index=70.14) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0116 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(70.14);
      logInfo(`imageAt(index=70.14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0116 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0117
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0117
     * @tc.desc      RefreshButtonState.imageAt(index=-7) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0117 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-7);
      logInfo(`imageAt(index=-7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0117 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0118
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0118
     * @tc.desc      RefreshButtonState.imageAt(index=-82) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0118 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-82);
      logInfo(`imageAt(index=-82): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0118 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0119
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0119
     * @tc.desc      RefreshButtonState.imageAt(index=-85) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0119 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-85);
      logInfo(`imageAt(index=-85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0119 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0120
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0120
     * @tc.desc      RefreshButtonState.imageAt(index=-4) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0120 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-4);
      logInfo(`imageAt(index=-4): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0120 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0121
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0121
     * @tc.desc      RefreshButtonState.imageAt(index=-14) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0121 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-14);
      logInfo(`imageAt(index=-14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0121 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0122
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0122
     * @tc.desc      RefreshButtonState.imageAt(index=151) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0122 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(151);
      logInfo(`imageAt(index=151): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0122 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0123
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0123
     * @tc.desc      RefreshButtonState.imageAt(index=70.87) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0123 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(70.87);
      logInfo(`imageAt(index=70.87): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0123 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0124
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0124
     * @tc.desc      RefreshButtonState.imageAt(index=18.8) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0124 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(18.8);
      logInfo(`imageAt(index=18.8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0124 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0125
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0125
     * @tc.desc      RefreshButtonState.imageAt(index=71.81) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0125 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(71.81);
      logInfo(`imageAt(index=71.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0125 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0126
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0126
     * @tc.desc      RefreshButtonState.imageAt(index=-96) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0126 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-96);
      logInfo(`imageAt(index=-96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0126 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0127
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0127
     * @tc.desc      RefreshButtonState.imageAt(index=51.57) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0127 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(51.57);
      logInfo(`imageAt(index=51.57): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0127 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0128
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0128
     * @tc.desc      RefreshButtonState.imageAt(index=59) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0128 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(59);
      logInfo(`imageAt(index=59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0128 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0129
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0129
     * @tc.desc      RefreshButtonState.imageAt(index=101) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0129 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(101);
      logInfo(`imageAt(index=101): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0129 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0130
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0130
     * @tc.desc      RefreshButtonState.imageAt(index=92) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0130 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(92);
      logInfo(`imageAt(index=92): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0130 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0131
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0131
     * @tc.desc      RefreshButtonState.imageAt(index=-51) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0131 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-51);
      logInfo(`imageAt(index=-51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0131 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0132
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0132
     * @tc.desc      RefreshButtonState.imageAt(index=-28) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0132 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-28);
      logInfo(`imageAt(index=-28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0132 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0133
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0133
     * @tc.desc      RefreshButtonState.imageAt(index=26.38) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0133 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(26.38);
      logInfo(`imageAt(index=26.38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0133 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0134
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0134
     * @tc.desc      RefreshButtonState.imageAt(index=161) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0134 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(161);
      logInfo(`imageAt(index=161): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0134 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0135
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0135
     * @tc.desc      RefreshButtonState.imageAt(index=30.19) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0135 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(30.19);
      logInfo(`imageAt(index=30.19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0135 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0136
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0136
     * @tc.desc      RefreshButtonState.imageAt(index=18) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0136 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(18);
      logInfo(`imageAt(index=18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0136 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0137
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0137
     * @tc.desc      RefreshButtonState.imageAt(index=177) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0137 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(177);
      logInfo(`imageAt(index=177): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0137 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0138
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0138
     * @tc.desc      RefreshButtonState.imageAt(index=52.33) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0138 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(52.33);
      logInfo(`imageAt(index=52.33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0138 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0139
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0139
     * @tc.desc      RefreshButtonState.imageAt(index=-93) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0139 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-93);
      logInfo(`imageAt(index=-93): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0139 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0140
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0140
     * @tc.desc      RefreshButtonState.imageAt(index=83) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0140 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(83);
      logInfo(`imageAt(index=83): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0140 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0141
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0141
     * @tc.desc      RefreshButtonState.imageAt(index=14.1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0141 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(14.1);
      logInfo(`imageAt(index=14.1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0141 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0142
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0142
     * @tc.desc      RefreshButtonState.imageAt(index=48.99) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0142 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(48.99);
      logInfo(`imageAt(index=48.99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0142 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0143
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0143
     * @tc.desc      RefreshButtonState.imageAt(index=164) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0143 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(164);
      logInfo(`imageAt(index=164): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0143 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0144
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0144
     * @tc.desc      RefreshButtonState.imageAt(index=55.61) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0144 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(55.61);
      logInfo(`imageAt(index=55.61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0144 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0145
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0145
     * @tc.desc      RefreshButtonState.imageAt(index=32.55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0145 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(32.55);
      logInfo(`imageAt(index=32.55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0145 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0146
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0146
     * @tc.desc      RefreshButtonState.imageAt(index=29.13) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0146 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(29.13);
      logInfo(`imageAt(index=29.13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0146 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0147
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0147
     * @tc.desc      RefreshButtonState.imageAt(index=-26) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0147 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-26);
      logInfo(`imageAt(index=-26): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0147 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0148
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0148
     * @tc.desc      RefreshButtonState.imageAt(index=196) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0148 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(196);
      logInfo(`imageAt(index=196): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0148 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0149
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0149
     * @tc.desc      RefreshButtonState.imageAt(index=49) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0149 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(49);
      logInfo(`imageAt(index=49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0149 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0150
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0150
     * @tc.desc      RefreshButtonState.imageAt(index=-37) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0150 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-37);
      logInfo(`imageAt(index=-37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0150 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0151
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0151
     * @tc.desc      RefreshButtonState.imageAt(index=54) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0151 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(54);
      logInfo(`imageAt(index=54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0151 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0152
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0152
     * @tc.desc      RefreshButtonState.imageAt(index=-69) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0152 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-69);
      logInfo(`imageAt(index=-69): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0152 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0153
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0153
     * @tc.desc      RefreshButtonState.imageAt(index=6.91) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0153 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(6.91);
      logInfo(`imageAt(index=6.91): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0153 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0154
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0154
     * @tc.desc      RefreshButtonState.imageAt(index=84.64) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0154 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(84.64);
      logInfo(`imageAt(index=84.64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0154 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0155
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0155
     * @tc.desc      RefreshButtonState.imageAt(index=23.58) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0155 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(23.58);
      logInfo(`imageAt(index=23.58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0155 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0156
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0156
     * @tc.desc      RefreshButtonState.imageAt(index=77) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0156 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(77);
      logInfo(`imageAt(index=77): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0156 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0157
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0157
     * @tc.desc      RefreshButtonState.imageAt(index=49.03) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0157 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(49.03);
      logInfo(`imageAt(index=49.03): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0157 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0158
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0158
     * @tc.desc      RefreshButtonState.imageAt(index=13) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0158 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(13);
      logInfo(`imageAt(index=13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0158 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0159
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0159
     * @tc.desc      RefreshButtonState.imageAt(index=55.98) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0159 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(55.98);
      logInfo(`imageAt(index=55.98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0159 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0160
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0160
     * @tc.desc      RefreshButtonState.imageAt(index=38) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0160 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(38);
      logInfo(`imageAt(index=38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0160 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0161
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0161
     * @tc.desc      RefreshButtonState.imageAt(index=167) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0161 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(167);
      logInfo(`imageAt(index=167): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0161 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0162
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0162
     * @tc.desc      RefreshButtonState.imageAt(index=23.32) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0162 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(23.32);
      logInfo(`imageAt(index=23.32): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0162 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0163
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0163
     * @tc.desc      RefreshButtonState.imageAt(index=156) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0163 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(156);
      logInfo(`imageAt(index=156): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0163 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0164
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0164
     * @tc.desc      RefreshButtonState.imageAt(index=58.29) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0164 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(58.29);
      logInfo(`imageAt(index=58.29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0164 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0165
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0165
     * @tc.desc      RefreshButtonState.imageAt(index=82.88) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0165 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(82.88);
      logInfo(`imageAt(index=82.88): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0165 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0166
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0166
     * @tc.desc      RefreshButtonState.imageAt(index=-91) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0166 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-91);
      logInfo(`imageAt(index=-91): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0166 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0167
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0167
     * @tc.desc      RefreshButtonState.imageAt(index=41) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0167 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(41);
      logInfo(`imageAt(index=41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0167 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0168
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0168
     * @tc.desc      RefreshButtonState.imageAt(index=89) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0168 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(89);
      logInfo(`imageAt(index=89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0168 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0169
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0169
     * @tc.desc      RefreshButtonState.imageAt(index=0.73) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0169 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(0.73);
      logInfo(`imageAt(index=0.73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0169 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0170
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0170
     * @tc.desc      RefreshButtonState.imageAt(index=-76) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0170 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-76);
      logInfo(`imageAt(index=-76): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0170 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0171
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0171
     * @tc.desc      RefreshButtonState.imageAt(index=-90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0171 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-90);
      logInfo(`imageAt(index=-90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0171 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0172
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0172
     * @tc.desc      RefreshButtonState.imageAt(index=143) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0172 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(143);
      logInfo(`imageAt(index=143): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0172 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0173
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0173
     * @tc.desc      RefreshButtonState.imageAt(index=0.6) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0173 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(0.6);
      logInfo(`imageAt(index=0.6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0173 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0174
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0174
     * @tc.desc      RefreshButtonState.imageAt(index=-87) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0174 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(-87);
      logInfo(`imageAt(index=-87): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0174 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_IMAGE_AT_0175
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateImageAt_0175
     * @tc.desc      RefreshButtonState.imageAt(index=72) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateImageAt_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0175 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const actual: string = subject.imageAt(72);
      logInfo(`imageAt(index=72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateImageAt_0175 end`);
    });
  });
}
