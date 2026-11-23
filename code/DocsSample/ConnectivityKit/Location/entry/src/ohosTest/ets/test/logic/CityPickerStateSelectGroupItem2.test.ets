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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CityPickerState } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CityPickerState.selectGroupItem (17 cases). */
export default function cityPickerStateSelectGroupItem2Test(): void {
  describe('CityPickerStateSelectGroupItem2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0074
     * @tc.name      Location_CityPickerStateSelectGroupItem_0074
     * @tc.desc      CityPickerState.selectGroupItem(name="do6WJKrZOydF") yields "do6WJKrZOydF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0074 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('do6WJKrZOydF');
      logInfo(`selectGroupItem(name="do6WJKrZOydF"): actual=${actual}`);
      expect(actual).assertEqual('do6WJKrZOydF');
      logInfo(`selectGroupItem(name="do6WJKrZOydF") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('do6WJKrZOydF');
      logInfo(`selectGroupItem(name="do6WJKrZOydF") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('do6WJKrZOydF');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0075
     * @tc.name      Location_CityPickerStateSelectGroupItem_0075
     * @tc.desc      CityPickerState.selectGroupItem(name="nBDuteOzM4Tb") yields "nBDuteOzM4Tb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0075 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('nBDuteOzM4Tb');
      logInfo(`selectGroupItem(name="nBDuteOzM4Tb"): actual=${actual}`);
      expect(actual).assertEqual('nBDuteOzM4Tb');
      logInfo(`selectGroupItem(name="nBDuteOzM4Tb") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('nBDuteOzM4Tb');
      logInfo(`selectGroupItem(name="nBDuteOzM4Tb") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('nBDuteOzM4Tb');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0076
     * @tc.name      Location_CityPickerStateSelectGroupItem_0076
     * @tc.desc      CityPickerState.selectGroupItem(name="3NCmQ2erQ") yields "3NCmQ2erQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0076 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('3NCmQ2erQ');
      logInfo(`selectGroupItem(name="3NCmQ2erQ"): actual=${actual}`);
      expect(actual).assertEqual('3NCmQ2erQ');
      logInfo(`selectGroupItem(name="3NCmQ2erQ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('3NCmQ2erQ');
      logInfo(`selectGroupItem(name="3NCmQ2erQ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('3NCmQ2erQ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0077
     * @tc.name      Location_CityPickerStateSelectGroupItem_0077
     * @tc.desc      CityPickerState.selectGroupItem(name="I") yields "I"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0077 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('I');
      logInfo(`selectGroupItem(name="I"): actual=${actual}`);
      expect(actual).assertEqual('I');
      logInfo(`selectGroupItem(name="I") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('I');
      logInfo(`selectGroupItem(name="I") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('I');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0078
     * @tc.name      Location_CityPickerStateSelectGroupItem_0078
     * @tc.desc      CityPickerState.selectGroupItem(name="h") yields "h"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0078 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('h');
      logInfo(`selectGroupItem(name="h"): actual=${actual}`);
      expect(actual).assertEqual('h');
      logInfo(`selectGroupItem(name="h") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('h');
      logInfo(`selectGroupItem(name="h") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('h');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0079
     * @tc.name      Location_CityPickerStateSelectGroupItem_0079
     * @tc.desc      CityPickerState.selectGroupItem(name="i6ZgL6SJof") yields "i6ZgL6SJof"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0079 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('i6ZgL6SJof');
      logInfo(`selectGroupItem(name="i6ZgL6SJof"): actual=${actual}`);
      expect(actual).assertEqual('i6ZgL6SJof');
      logInfo(`selectGroupItem(name="i6ZgL6SJof") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('i6ZgL6SJof');
      logInfo(`selectGroupItem(name="i6ZgL6SJof") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('i6ZgL6SJof');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0080
     * @tc.name      Location_CityPickerStateSelectGroupItem_0080
     * @tc.desc      CityPickerState.selectGroupItem(name="9D2IQ9Q") yields "9D2IQ9Q"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0080 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('9D2IQ9Q');
      logInfo(`selectGroupItem(name="9D2IQ9Q"): actual=${actual}`);
      expect(actual).assertEqual('9D2IQ9Q');
      logInfo(`selectGroupItem(name="9D2IQ9Q") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('9D2IQ9Q');
      logInfo(`selectGroupItem(name="9D2IQ9Q") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('9D2IQ9Q');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0081
     * @tc.name      Location_CityPickerStateSelectGroupItem_0081
     * @tc.desc      CityPickerState.selectGroupItem(name="F1mu2") yields "F1mu2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0081 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('F1mu2');
      logInfo(`selectGroupItem(name="F1mu2"): actual=${actual}`);
      expect(actual).assertEqual('F1mu2');
      logInfo(`selectGroupItem(name="F1mu2") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('F1mu2');
      logInfo(`selectGroupItem(name="F1mu2") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('F1mu2');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0081 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0082
     * @tc.name      Location_CityPickerStateSelectGroupItem_0082
     * @tc.desc      CityPickerState.selectGroupItem(name="PYe") yields "PYe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0082 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('PYe');
      logInfo(`selectGroupItem(name="PYe"): actual=${actual}`);
      expect(actual).assertEqual('PYe');
      logInfo(`selectGroupItem(name="PYe") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('PYe');
      logInfo(`selectGroupItem(name="PYe") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('PYe');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0083
     * @tc.name      Location_CityPickerStateSelectGroupItem_0083
     * @tc.desc      CityPickerState.selectGroupItem(name="XCoBidfLX") yields "XCoBidfLX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0083 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('XCoBidfLX');
      logInfo(`selectGroupItem(name="XCoBidfLX"): actual=${actual}`);
      expect(actual).assertEqual('XCoBidfLX');
      logInfo(`selectGroupItem(name="XCoBidfLX") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('XCoBidfLX');
      logInfo(`selectGroupItem(name="XCoBidfLX") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('XCoBidfLX');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0084
     * @tc.name      Location_CityPickerStateSelectGroupItem_0084
     * @tc.desc      CityPickerState.selectGroupItem(name="gWfTR0PCFH4k") yields "gWfTR0PCFH4k"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0084 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('gWfTR0PCFH4k');
      logInfo(`selectGroupItem(name="gWfTR0PCFH4k"): actual=${actual}`);
      expect(actual).assertEqual('gWfTR0PCFH4k');
      logInfo(`selectGroupItem(name="gWfTR0PCFH4k") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('gWfTR0PCFH4k');
      logInfo(`selectGroupItem(name="gWfTR0PCFH4k") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('gWfTR0PCFH4k');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0084 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0085
     * @tc.name      Location_CityPickerStateSelectGroupItem_0085
     * @tc.desc      CityPickerState.selectGroupItem(name="R2") yields "R2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0085 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('R2');
      logInfo(`selectGroupItem(name="R2"): actual=${actual}`);
      expect(actual).assertEqual('R2');
      logInfo(`selectGroupItem(name="R2") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('R2');
      logInfo(`selectGroupItem(name="R2") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('R2');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0086
     * @tc.name      Location_CityPickerStateSelectGroupItem_0086
     * @tc.desc      CityPickerState.selectGroupItem(name="AvHIxQjc") yields "AvHIxQjc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0086 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('AvHIxQjc');
      logInfo(`selectGroupItem(name="AvHIxQjc"): actual=${actual}`);
      expect(actual).assertEqual('AvHIxQjc');
      logInfo(`selectGroupItem(name="AvHIxQjc") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('AvHIxQjc');
      logInfo(`selectGroupItem(name="AvHIxQjc") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('AvHIxQjc');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0087
     * @tc.name      Location_CityPickerStateSelectGroupItem_0087
     * @tc.desc      CityPickerState.selectGroupItem(name="9") yields "9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0087 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('9');
      logInfo(`selectGroupItem(name="9"): actual=${actual}`);
      expect(actual).assertEqual('9');
      logInfo(`selectGroupItem(name="9") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('9');
      logInfo(`selectGroupItem(name="9") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('9');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0088
     * @tc.name      Location_CityPickerStateSelectGroupItem_0088
     * @tc.desc      CityPickerState.selectGroupItem(name="Zx8UqEh4Kb") yields "Zx8UqEh4Kb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0088 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Zx8UqEh4Kb');
      logInfo(`selectGroupItem(name="Zx8UqEh4Kb"): actual=${actual}`);
      expect(actual).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectGroupItem(name="Zx8UqEh4Kb") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectGroupItem(name="Zx8UqEh4Kb") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Zx8UqEh4Kb');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0089
     * @tc.name      Location_CityPickerStateSelectGroupItem_0089
     * @tc.desc      CityPickerState.selectGroupItem(name="b84Hgff9DvSb") yields "b84Hgff9DvSb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0089 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('b84Hgff9DvSb');
      logInfo(`selectGroupItem(name="b84Hgff9DvSb"): actual=${actual}`);
      expect(actual).assertEqual('b84Hgff9DvSb');
      logInfo(`selectGroupItem(name="b84Hgff9DvSb") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('b84Hgff9DvSb');
      logInfo(`selectGroupItem(name="b84Hgff9DvSb") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('b84Hgff9DvSb');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0089 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0090
     * @tc.name      Location_CityPickerStateSelectGroupItem_0090
     * @tc.desc      CityPickerState.selectGroupItem(name="BOMr") yields "BOMr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0090 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('BOMr');
      logInfo(`selectGroupItem(name="BOMr"): actual=${actual}`);
      expect(actual).assertEqual('BOMr');
      logInfo(`selectGroupItem(name="BOMr") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('BOMr');
      logInfo(`selectGroupItem(name="BOMr") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('BOMr');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0090 end`);
    });
  });
}
