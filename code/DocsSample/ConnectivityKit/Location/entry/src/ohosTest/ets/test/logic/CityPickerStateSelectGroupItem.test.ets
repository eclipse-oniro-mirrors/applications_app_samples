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

/** Logic checks for CityPickerState.selectGroupItem (73 cases). */
export default function cityPickerStateSelectGroupItemTest(): void {
  describe('CityPickerStateSelectGroupItemTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0001
     * @tc.name      Location_CityPickerStateSelectGroupItem_0001
     * @tc.desc      CityPickerState.selectGroupItem(name="") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateSelectGroupItem_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0001 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('');
      logInfo(`selectGroupItem(name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0002
     * @tc.name      Location_CityPickerStateSelectGroupItem_0002
     * @tc.desc      CityPickerState.selectGroupItem(name="x") yields "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateSelectGroupItem_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0002 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('x');
      logInfo(`selectGroupItem(name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`selectGroupItem(name="x") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x');
      logInfo(`selectGroupItem(name="x") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0003
     * @tc.name      Location_CityPickerStateSelectGroupItem_0003
     * @tc.desc      CityPickerState.selectGroupItem(name="Hello") yields "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0003 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Hello');
      logInfo(`selectGroupItem(name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`selectGroupItem(name="Hello") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello');
      logInfo(`selectGroupItem(name="Hello") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0004
     * @tc.name      Location_CityPickerStateSelectGroupItem_0004
     * @tc.desc      CityPickerState.selectGroupItem(name="hello world") yields "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0004 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('hello world');
      logInfo(`selectGroupItem(name="hello world"): actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`selectGroupItem(name="hello world") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('hello world');
      logInfo(`selectGroupItem(name="hello world") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('hello world');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0005
     * @tc.name      Location_CityPickerStateSelectGroupItem_0005
     * @tc.desc      CityPickerState.selectGroupItem(name=" ") yields " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0005 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' ');
      logInfo(`selectGroupItem(name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`selectGroupItem(name=" ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' ');
      logInfo(`selectGroupItem(name=" ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0006
     * @tc.name      Location_CityPickerStateSelectGroupItem_0006
     * @tc.desc      CityPickerState.selectGroupItem(name="A") yields "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0006 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('A');
      logInfo(`selectGroupItem(name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`selectGroupItem(name="A") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('A');
      logInfo(`selectGroupItem(name="A") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('A');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0007
     * @tc.name      Location_CityPickerStateSelectGroupItem_0007
     * @tc.desc      CityPickerState.selectGroupItem(name="Sample Title 123") yields "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0007 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Sample Title 123');
      logInfo(`selectGroupItem(name="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`selectGroupItem(name="Sample Title 123") ...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Sample Title 123');
      logInfo(`selectGroupItem(name="Sample Title 123") ...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0008
     * @tc.name      Location_CityPickerStateSelectGroupItem_0008
     * @tc.desc      CityPickerState.selectGroupItem(name="??") yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0008 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('\u4e2d\u6587');
      logInfo(`selectGroupItem(name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`selectGroupItem(name="??") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e2d\u6587');
      logInfo(`selectGroupItem(name="??") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0009
     * @tc.name      Location_CityPickerStateSelectGroupItem_0009
     * @tc.desc      CityPickerState.selectGroupItem(name="a") yields "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0009 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('a');
      logInfo(`selectGroupItem(name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`selectGroupItem(name="a") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('a');
      logInfo(`selectGroupItem(name="a") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0010
     * @tc.name      Location_CityPickerStateSelectGroupItem_0010
     * @tc.desc      CityPickerState.selectGroupItem(name="abc") yields "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0010 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('abc');
      logInfo(`selectGroupItem(name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`selectGroupItem(name="abc") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc');
      logInfo(`selectGroupItem(name="abc") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0011
     * @tc.name      Location_CityPickerStateSelectGroupItem_0011
     * @tc.desc      CityPickerState.selectGroupItem(name="Hello World") yields "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0011 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Hello World');
      logInfo(`selectGroupItem(name="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`selectGroupItem(name="Hello World") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello World');
      logInfo(`selectGroupItem(name="Hello World") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0012
     * @tc.name      Location_CityPickerStateSelectGroupItem_0012
     * @tc.desc      CityPickerState.selectGroupItem(name="123") yields "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0012 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('123');
      logInfo(`selectGroupItem(name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`selectGroupItem(name="123") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('123');
      logInfo(`selectGroupItem(name="123") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0013
     * @tc.name      Location_CityPickerStateSelectGroupItem_0013
     * @tc.desc      CityPickerState.selectGroupItem(name=" x ") yields " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0013 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' x ');
      logInfo(`selectGroupItem(name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`selectGroupItem(name=" x ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' x ');
      logInfo(`selectGroupItem(name=" x ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' x ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0014
     * @tc.name      Location_CityPickerStateSelectGroupItem_0014
     * @tc.desc      CityPickerState.selectGroupItem(name="xx") yields "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0014 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('xx');
      logInfo(`selectGroupItem(name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`selectGroupItem(name="xx") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xx');
      logInfo(`selectGroupItem(name="xx") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xx');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0015
     * @tc.name      Location_CityPickerStateSelectGroupItem_0015
     * @tc.desc      CityPickerState.selectGroupItem(name="x_1") yields "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0015 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('x_1');
      logInfo(`selectGroupItem(name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`selectGroupItem(name="x_1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x_1');
      logInfo(`selectGroupItem(name="x_1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0016
     * @tc.name      Location_CityPickerStateSelectGroupItem_0016
     * @tc.desc      CityPickerState.selectGroupItem(name=" Hello ") yields " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0016 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' Hello ');
      logInfo(`selectGroupItem(name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`selectGroupItem(name=" Hello ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' Hello ');
      logInfo(`selectGroupItem(name=" Hello ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' Hello ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0017
     * @tc.name      Location_CityPickerStateSelectGroupItem_0017
     * @tc.desc      CityPickerState.selectGroupItem(name="HelloHello") yields "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0017 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('HelloHello');
      logInfo(`selectGroupItem(name="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`selectGroupItem(name="HelloHello") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('HelloHello');
      logInfo(`selectGroupItem(name="HelloHello") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('HelloHello');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0018
     * @tc.name      Location_CityPickerStateSelectGroupItem_0018
     * @tc.desc      CityPickerState.selectGroupItem(name="Hello_1") yields "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0018 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Hello_1');
      logInfo(`selectGroupItem(name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`selectGroupItem(name="Hello_1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello_1');
      logInfo(`selectGroupItem(name="Hello_1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0019
     * @tc.name      Location_CityPickerStateSelectGroupItem_0019
     * @tc.desc      CityPickerState.selectGroupItem(name="xHello") yields "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0019 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('xHello');
      logInfo(`selectGroupItem(name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`selectGroupItem(name="xHello") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xHello');
      logInfo(`selectGroupItem(name="xHello") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xHello');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0020
     * @tc.name      Location_CityPickerStateSelectGroupItem_0020
     * @tc.desc      CityPickerState.selectGroupItem(name=" hello world ") yields " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0020 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' hello world ');
      logInfo(`selectGroupItem(name=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`selectGroupItem(name=" hello world ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' hello world ');
      logInfo(`selectGroupItem(name=" hello world ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' hello world ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0021
     * @tc.name      Location_CityPickerStateSelectGroupItem_0021
     * @tc.desc      CityPickerState.selectGroupItem(name="hello worldhello world") yields "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0021 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('hello worldhello world');
      logInfo(`selectGroupItem(name="hello worldhello wo...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`selectGroupItem(name="hello worldhello wo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('hello worldhello world');
      logInfo(`selectGroupItem(name="hello worldhello wo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0022
     * @tc.name      Location_CityPickerStateSelectGroupItem_0022
     * @tc.desc      CityPickerState.selectGroupItem(name="hello world_1") yields "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0022 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('hello world_1');
      logInfo(`selectGroupItem(name="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`selectGroupItem(name="hello world_1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('hello world_1');
      logInfo(`selectGroupItem(name="hello world_1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('hello world_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0023
     * @tc.name      Location_CityPickerStateSelectGroupItem_0023
     * @tc.desc      CityPickerState.selectGroupItem(name="xhello world") yields "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0023 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('xhello world');
      logInfo(`selectGroupItem(name="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`selectGroupItem(name="xhello world") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xhello world');
      logInfo(`selectGroupItem(name="xhello world") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xhello world');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0024
     * @tc.name      Location_CityPickerStateSelectGroupItem_0024
     * @tc.desc      CityPickerState.selectGroupItem(name="   ") yields "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0024 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('   ');
      logInfo(`selectGroupItem(name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`selectGroupItem(name="   ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('   ');
      logInfo(`selectGroupItem(name="   ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('   ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0025
     * @tc.name      Location_CityPickerStateSelectGroupItem_0025
     * @tc.desc      CityPickerState.selectGroupItem(name="  ") yields "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0025 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('  ');
      logInfo(`selectGroupItem(name="  "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`selectGroupItem(name="  ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('  ');
      logInfo(`selectGroupItem(name="  ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('  ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0026
     * @tc.name      Location_CityPickerStateSelectGroupItem_0026
     * @tc.desc      CityPickerState.selectGroupItem(name=" _1") yields " _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0026 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' _1');
      logInfo(`selectGroupItem(name=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' _1');
      logInfo(`selectGroupItem(name=" _1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' _1');
      logInfo(`selectGroupItem(name=" _1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' _1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0027
     * @tc.name      Location_CityPickerStateSelectGroupItem_0027
     * @tc.desc      CityPickerState.selectGroupItem(name="x ") yields "x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0027 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('x ');
      logInfo(`selectGroupItem(name="x "): actual=${actual}`);
      expect(actual).assertEqual('x ');
      logInfo(`selectGroupItem(name="x ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x ');
      logInfo(`selectGroupItem(name="x ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0028
     * @tc.name      Location_CityPickerStateSelectGroupItem_0028
     * @tc.desc      CityPickerState.selectGroupItem(name=" A ") yields " A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0028 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' A ');
      logInfo(`selectGroupItem(name=" A "): actual=${actual}`);
      expect(actual).assertEqual(' A ');
      logInfo(`selectGroupItem(name=" A ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' A ');
      logInfo(`selectGroupItem(name=" A ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' A ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0029
     * @tc.name      Location_CityPickerStateSelectGroupItem_0029
     * @tc.desc      CityPickerState.selectGroupItem(name="AA") yields "AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0029 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('AA');
      logInfo(`selectGroupItem(name="AA"): actual=${actual}`);
      expect(actual).assertEqual('AA');
      logInfo(`selectGroupItem(name="AA") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('AA');
      logInfo(`selectGroupItem(name="AA") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('AA');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0030
     * @tc.name      Location_CityPickerStateSelectGroupItem_0030
     * @tc.desc      CityPickerState.selectGroupItem(name="A_1") yields "A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0030 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('A_1');
      logInfo(`selectGroupItem(name="A_1"): actual=${actual}`);
      expect(actual).assertEqual('A_1');
      logInfo(`selectGroupItem(name="A_1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('A_1');
      logInfo(`selectGroupItem(name="A_1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('A_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0031
     * @tc.name      Location_CityPickerStateSelectGroupItem_0031
     * @tc.desc      CityPickerState.selectGroupItem(name="xA") yields "xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0031 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('xA');
      logInfo(`selectGroupItem(name="xA"): actual=${actual}`);
      expect(actual).assertEqual('xA');
      logInfo(`selectGroupItem(name="xA") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xA');
      logInfo(`selectGroupItem(name="xA") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xA');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0032
     * @tc.name      Location_CityPickerStateSelectGroupItem_0032
     * @tc.desc      CityPickerState.selectGroupItem(name=" Sample Title 123 ") yields " Sample Title 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0032 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' Sample Title 123 ');
      logInfo(`selectGroupItem(name=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual(' Sample Title 123 ');
      logInfo(`selectGroupItem(name=" Sample Title 123 "...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' Sample Title 123 ');
      logInfo(`selectGroupItem(name=" Sample Title 123 "...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' Sample Title 123 ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0033
     * @tc.name      Location_CityPickerStateSelectGroupItem_0033
     * @tc.desc      CityPickerState.selectGroupItem(name="Sample Title 123Sample Title 123") yields "Sample Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0033 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Sample Title 123Sample Title 123');
      logInfo(`selectGroupItem(name="Sample Title 123Sam...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`selectGroupItem(name="Sample Title 123Sam...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`selectGroupItem(name="Sample Title 123Sam...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0034
     * @tc.name      Location_CityPickerStateSelectGroupItem_0034
     * @tc.desc      CityPickerState.selectGroupItem(name="Sample Title 123_1") yields "Sample Title 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0034 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Sample Title 123_1');
      logInfo(`selectGroupItem(name="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123_1');
      logInfo(`selectGroupItem(name="Sample Title 123_1"...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Sample Title 123_1');
      logInfo(`selectGroupItem(name="Sample Title 123_1"...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Sample Title 123_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0035
     * @tc.name      Location_CityPickerStateSelectGroupItem_0035
     * @tc.desc      CityPickerState.selectGroupItem(name="xSample Title 123") yields "xSample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0035 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('xSample Title 123');
      logInfo(`selectGroupItem(name="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('xSample Title 123');
      logInfo(`selectGroupItem(name="xSample Title 123")...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xSample Title 123');
      logInfo(`selectGroupItem(name="xSample Title 123")...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xSample Title 123');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0036
     * @tc.name      Location_CityPickerStateSelectGroupItem_0036
     * @tc.desc      CityPickerState.selectGroupItem(name=" ?? ") yields " ?? "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0036 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' \u4e2d\u6587 ');
      logInfo(`selectGroupItem(name=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(' \u4e2d\u6587 ');
      logInfo(`selectGroupItem(name=" ?? ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' \u4e2d\u6587 ');
      logInfo(`selectGroupItem(name=" ?? ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' \u4e2d\u6587 ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0037
     * @tc.name      Location_CityPickerStateSelectGroupItem_0037
     * @tc.desc      CityPickerState.selectGroupItem(name="????") yields "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0037 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`selectGroupItem(name="????"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`selectGroupItem(name="????") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`selectGroupItem(name="????") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0038
     * @tc.name      Location_CityPickerStateSelectGroupItem_0038
     * @tc.desc      CityPickerState.selectGroupItem(name="??_1") yields "??_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0038 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('\u4e2d\u6587_1');
      logInfo(`selectGroupItem(name="??_1"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587_1');
      logInfo(`selectGroupItem(name="??_1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e2d\u6587_1');
      logInfo(`selectGroupItem(name="??_1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('\u4e2d\u6587_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0039
     * @tc.name      Location_CityPickerStateSelectGroupItem_0039
     * @tc.desc      CityPickerState.selectGroupItem(name="x??") yields "x??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0039 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('x\u4e2d\u6587');
      logInfo(`selectGroupItem(name="x??"): actual=${actual}`);
      expect(actual).assertEqual('x\u4e2d\u6587');
      logInfo(`selectGroupItem(name="x??") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x\u4e2d\u6587');
      logInfo(`selectGroupItem(name="x??") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x\u4e2d\u6587');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0040
     * @tc.name      Location_CityPickerStateSelectGroupItem_0040
     * @tc.desc      CityPickerState.selectGroupItem(name=" a ") yields " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0040 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' a ');
      logInfo(`selectGroupItem(name=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`selectGroupItem(name=" a ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' a ');
      logInfo(`selectGroupItem(name=" a ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' a ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0041
     * @tc.name      Location_CityPickerStateSelectGroupItem_0041
     * @tc.desc      CityPickerState.selectGroupItem(name="aa") yields "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0041 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('aa');
      logInfo(`selectGroupItem(name="aa"): actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`selectGroupItem(name="aa") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('aa');
      logInfo(`selectGroupItem(name="aa") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('aa');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0042
     * @tc.name      Location_CityPickerStateSelectGroupItem_0042
     * @tc.desc      CityPickerState.selectGroupItem(name="a_1") yields "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0042 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('a_1');
      logInfo(`selectGroupItem(name="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`selectGroupItem(name="a_1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('a_1');
      logInfo(`selectGroupItem(name="a_1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('a_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0043
     * @tc.name      Location_CityPickerStateSelectGroupItem_0043
     * @tc.desc      CityPickerState.selectGroupItem(name="xa") yields "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0043 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('xa');
      logInfo(`selectGroupItem(name="xa"): actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`selectGroupItem(name="xa") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xa');
      logInfo(`selectGroupItem(name="xa") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xa');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0044
     * @tc.name      Location_CityPickerStateSelectGroupItem_0044
     * @tc.desc      CityPickerState.selectGroupItem(name=" abc ") yields " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0044 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' abc ');
      logInfo(`selectGroupItem(name=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`selectGroupItem(name=" abc ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' abc ');
      logInfo(`selectGroupItem(name=" abc ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' abc ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0045
     * @tc.name      Location_CityPickerStateSelectGroupItem_0045
     * @tc.desc      CityPickerState.selectGroupItem(name="abcabc") yields "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0045 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('abcabc');
      logInfo(`selectGroupItem(name="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`selectGroupItem(name="abcabc") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abcabc');
      logInfo(`selectGroupItem(name="abcabc") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abcabc');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0046
     * @tc.name      Location_CityPickerStateSelectGroupItem_0046
     * @tc.desc      CityPickerState.selectGroupItem(name="abc_1") yields "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0046 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('abc_1');
      logInfo(`selectGroupItem(name="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`selectGroupItem(name="abc_1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc_1');
      logInfo(`selectGroupItem(name="abc_1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0047
     * @tc.name      Location_CityPickerStateSelectGroupItem_0047
     * @tc.desc      CityPickerState.selectGroupItem(name="xabc") yields "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0047 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('xabc');
      logInfo(`selectGroupItem(name="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`selectGroupItem(name="xabc") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xabc');
      logInfo(`selectGroupItem(name="xabc") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xabc');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0048
     * @tc.name      Location_CityPickerStateSelectGroupItem_0048
     * @tc.desc      CityPickerState.selectGroupItem(name=" Hello World ") yields " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0048 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' Hello World ');
      logInfo(`selectGroupItem(name=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`selectGroupItem(name=" Hello World ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' Hello World ');
      logInfo(`selectGroupItem(name=" Hello World ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0049
     * @tc.name      Location_CityPickerStateSelectGroupItem_0049
     * @tc.desc      CityPickerState.selectGroupItem(name="Hello WorldHello World") yields "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0049 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Hello WorldHello World');
      logInfo(`selectGroupItem(name="Hello WorldHello Wo...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`selectGroupItem(name="Hello WorldHello Wo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello WorldHello World');
      logInfo(`selectGroupItem(name="Hello WorldHello Wo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0050
     * @tc.name      Location_CityPickerStateSelectGroupItem_0050
     * @tc.desc      CityPickerState.selectGroupItem(name="Hello World_1") yields "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0050 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Hello World_1');
      logInfo(`selectGroupItem(name="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`selectGroupItem(name="Hello World_1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello World_1');
      logInfo(`selectGroupItem(name="Hello World_1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0051
     * @tc.name      Location_CityPickerStateSelectGroupItem_0051
     * @tc.desc      CityPickerState.selectGroupItem(name="xHello World") yields "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0051 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('xHello World');
      logInfo(`selectGroupItem(name="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`selectGroupItem(name="xHello World") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xHello World');
      logInfo(`selectGroupItem(name="xHello World") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xHello World');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0052
     * @tc.name      Location_CityPickerStateSelectGroupItem_0052
     * @tc.desc      CityPickerState.selectGroupItem(name=" 123 ") yields " 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0052 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem(' 123 ');
      logInfo(`selectGroupItem(name=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' 123 ');
      logInfo(`selectGroupItem(name=" 123 ") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' 123 ');
      logInfo(`selectGroupItem(name=" 123 ") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' 123 ');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0053
     * @tc.name      Location_CityPickerStateSelectGroupItem_0053
     * @tc.desc      CityPickerState.selectGroupItem(name="123123") yields "123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0053 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('123123');
      logInfo(`selectGroupItem(name="123123"): actual=${actual}`);
      expect(actual).assertEqual('123123');
      logInfo(`selectGroupItem(name="123123") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('123123');
      logInfo(`selectGroupItem(name="123123") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('123123');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0054
     * @tc.name      Location_CityPickerStateSelectGroupItem_0054
     * @tc.desc      CityPickerState.selectGroupItem(name="123_1") yields "123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0054 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('123_1');
      logInfo(`selectGroupItem(name="123_1"): actual=${actual}`);
      expect(actual).assertEqual('123_1');
      logInfo(`selectGroupItem(name="123_1") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('123_1');
      logInfo(`selectGroupItem(name="123_1") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('123_1');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0055
     * @tc.name      Location_CityPickerStateSelectGroupItem_0055
     * @tc.desc      CityPickerState.selectGroupItem(name="x123") yields "x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectGroupItem_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0055 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('x123');
      logInfo(`selectGroupItem(name="x123"): actual=${actual}`);
      expect(actual).assertEqual('x123');
      logInfo(`selectGroupItem(name="x123") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x123');
      logInfo(`selectGroupItem(name="x123") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x123');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0056
     * @tc.name      Location_CityPickerStateSelectGroupItem_0056
     * @tc.desc      CityPickerState.selectGroupItem(name="iPK4SzzcZdm") yields "iPK4SzzcZdm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0056 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('iPK4SzzcZdm');
      logInfo(`selectGroupItem(name="iPK4SzzcZdm"): actual=${actual}`);
      expect(actual).assertEqual('iPK4SzzcZdm');
      logInfo(`selectGroupItem(name="iPK4SzzcZdm") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('iPK4SzzcZdm');
      logInfo(`selectGroupItem(name="iPK4SzzcZdm") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('iPK4SzzcZdm');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0057
     * @tc.name      Location_CityPickerStateSelectGroupItem_0057
     * @tc.desc      CityPickerState.selectGroupItem(name="CoGTGspiIgx3") yields "CoGTGspiIgx3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0057 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('CoGTGspiIgx3');
      logInfo(`selectGroupItem(name="CoGTGspiIgx3"): actual=${actual}`);
      expect(actual).assertEqual('CoGTGspiIgx3');
      logInfo(`selectGroupItem(name="CoGTGspiIgx3") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('CoGTGspiIgx3');
      logInfo(`selectGroupItem(name="CoGTGspiIgx3") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('CoGTGspiIgx3');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0058
     * @tc.name      Location_CityPickerStateSelectGroupItem_0058
     * @tc.desc      CityPickerState.selectGroupItem(name="HvSeG") yields "HvSeG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0058 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('HvSeG');
      logInfo(`selectGroupItem(name="HvSeG"): actual=${actual}`);
      expect(actual).assertEqual('HvSeG');
      logInfo(`selectGroupItem(name="HvSeG") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('HvSeG');
      logInfo(`selectGroupItem(name="HvSeG") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('HvSeG');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0059
     * @tc.name      Location_CityPickerStateSelectGroupItem_0059
     * @tc.desc      CityPickerState.selectGroupItem(name="JxwFIuP") yields "JxwFIuP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0059 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('JxwFIuP');
      logInfo(`selectGroupItem(name="JxwFIuP"): actual=${actual}`);
      expect(actual).assertEqual('JxwFIuP');
      logInfo(`selectGroupItem(name="JxwFIuP") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('JxwFIuP');
      logInfo(`selectGroupItem(name="JxwFIuP") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('JxwFIuP');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0060
     * @tc.name      Location_CityPickerStateSelectGroupItem_0060
     * @tc.desc      CityPickerState.selectGroupItem(name="IL35fjYIc8ZN") yields "IL35fjYIc8ZN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0060 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('IL35fjYIc8ZN');
      logInfo(`selectGroupItem(name="IL35fjYIc8ZN"): actual=${actual}`);
      expect(actual).assertEqual('IL35fjYIc8ZN');
      logInfo(`selectGroupItem(name="IL35fjYIc8ZN") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('IL35fjYIc8ZN');
      logInfo(`selectGroupItem(name="IL35fjYIc8ZN") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('IL35fjYIc8ZN');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0061
     * @tc.name      Location_CityPickerStateSelectGroupItem_0061
     * @tc.desc      CityPickerState.selectGroupItem(name="s") yields "s"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0061 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('s');
      logInfo(`selectGroupItem(name="s"): actual=${actual}`);
      expect(actual).assertEqual('s');
      logInfo(`selectGroupItem(name="s") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('s');
      logInfo(`selectGroupItem(name="s") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('s');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0062
     * @tc.name      Location_CityPickerStateSelectGroupItem_0062
     * @tc.desc      CityPickerState.selectGroupItem(name="sn5Bb3a") yields "sn5Bb3a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0062 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('sn5Bb3a');
      logInfo(`selectGroupItem(name="sn5Bb3a"): actual=${actual}`);
      expect(actual).assertEqual('sn5Bb3a');
      logInfo(`selectGroupItem(name="sn5Bb3a") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('sn5Bb3a');
      logInfo(`selectGroupItem(name="sn5Bb3a") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('sn5Bb3a');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0063
     * @tc.name      Location_CityPickerStateSelectGroupItem_0063
     * @tc.desc      CityPickerState.selectGroupItem(name="J3b") yields "J3b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0063 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('J3b');
      logInfo(`selectGroupItem(name="J3b"): actual=${actual}`);
      expect(actual).assertEqual('J3b');
      logInfo(`selectGroupItem(name="J3b") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('J3b');
      logInfo(`selectGroupItem(name="J3b") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('J3b');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0064
     * @tc.name      Location_CityPickerStateSelectGroupItem_0064
     * @tc.desc      CityPickerState.selectGroupItem(name="ybbcOiTBwR") yields "ybbcOiTBwR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0064 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('ybbcOiTBwR');
      logInfo(`selectGroupItem(name="ybbcOiTBwR"): actual=${actual}`);
      expect(actual).assertEqual('ybbcOiTBwR');
      logInfo(`selectGroupItem(name="ybbcOiTBwR") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('ybbcOiTBwR');
      logInfo(`selectGroupItem(name="ybbcOiTBwR") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('ybbcOiTBwR');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0065
     * @tc.name      Location_CityPickerStateSelectGroupItem_0065
     * @tc.desc      CityPickerState.selectGroupItem(name="1ackXyqrj") yields "1ackXyqrj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0065 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('1ackXyqrj');
      logInfo(`selectGroupItem(name="1ackXyqrj"): actual=${actual}`);
      expect(actual).assertEqual('1ackXyqrj');
      logInfo(`selectGroupItem(name="1ackXyqrj") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('1ackXyqrj');
      logInfo(`selectGroupItem(name="1ackXyqrj") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('1ackXyqrj');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0066
     * @tc.name      Location_CityPickerStateSelectGroupItem_0066
     * @tc.desc      CityPickerState.selectGroupItem(name="oP") yields "oP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0066 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('oP');
      logInfo(`selectGroupItem(name="oP"): actual=${actual}`);
      expect(actual).assertEqual('oP');
      logInfo(`selectGroupItem(name="oP") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('oP');
      logInfo(`selectGroupItem(name="oP") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('oP');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0067
     * @tc.name      Location_CityPickerStateSelectGroupItem_0067
     * @tc.desc      CityPickerState.selectGroupItem(name="6YjdT4bu2") yields "6YjdT4bu2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0067 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('6YjdT4bu2');
      logInfo(`selectGroupItem(name="6YjdT4bu2"): actual=${actual}`);
      expect(actual).assertEqual('6YjdT4bu2');
      logInfo(`selectGroupItem(name="6YjdT4bu2") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('6YjdT4bu2');
      logInfo(`selectGroupItem(name="6YjdT4bu2") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('6YjdT4bu2');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0068
     * @tc.name      Location_CityPickerStateSelectGroupItem_0068
     * @tc.desc      CityPickerState.selectGroupItem(name="w0ECjbzt") yields "w0ECjbzt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0068 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('w0ECjbzt');
      logInfo(`selectGroupItem(name="w0ECjbzt"): actual=${actual}`);
      expect(actual).assertEqual('w0ECjbzt');
      logInfo(`selectGroupItem(name="w0ECjbzt") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('w0ECjbzt');
      logInfo(`selectGroupItem(name="w0ECjbzt") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('w0ECjbzt');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0069
     * @tc.name      Location_CityPickerStateSelectGroupItem_0069
     * @tc.desc      CityPickerState.selectGroupItem(name="MVitXjGcs") yields "MVitXjGcs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0069 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('MVitXjGcs');
      logInfo(`selectGroupItem(name="MVitXjGcs"): actual=${actual}`);
      expect(actual).assertEqual('MVitXjGcs');
      logInfo(`selectGroupItem(name="MVitXjGcs") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('MVitXjGcs');
      logInfo(`selectGroupItem(name="MVitXjGcs") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('MVitXjGcs');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0070
     * @tc.name      Location_CityPickerStateSelectGroupItem_0070
     * @tc.desc      CityPickerState.selectGroupItem(name="MRlLuI6x") yields "MRlLuI6x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0070 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('MRlLuI6x');
      logInfo(`selectGroupItem(name="MRlLuI6x"): actual=${actual}`);
      expect(actual).assertEqual('MRlLuI6x');
      logInfo(`selectGroupItem(name="MRlLuI6x") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('MRlLuI6x');
      logInfo(`selectGroupItem(name="MRlLuI6x") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('MRlLuI6x');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0071
     * @tc.name      Location_CityPickerStateSelectGroupItem_0071
     * @tc.desc      CityPickerState.selectGroupItem(name="Q3kDn1hQBGAX") yields "Q3kDn1hQBGAX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0071 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('Q3kDn1hQBGAX');
      logInfo(`selectGroupItem(name="Q3kDn1hQBGAX"): actual=${actual}`);
      expect(actual).assertEqual('Q3kDn1hQBGAX');
      logInfo(`selectGroupItem(name="Q3kDn1hQBGAX") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Q3kDn1hQBGAX');
      logInfo(`selectGroupItem(name="Q3kDn1hQBGAX") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Q3kDn1hQBGAX');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0072
     * @tc.name      Location_CityPickerStateSelectGroupItem_0072
     * @tc.desc      CityPickerState.selectGroupItem(name="ltiTwL0V5ck") yields "ltiTwL0V5ck"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0072 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('ltiTwL0V5ck');
      logInfo(`selectGroupItem(name="ltiTwL0V5ck"): actual=${actual}`);
      expect(actual).assertEqual('ltiTwL0V5ck');
      logInfo(`selectGroupItem(name="ltiTwL0V5ck") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('ltiTwL0V5ck');
      logInfo(`selectGroupItem(name="ltiTwL0V5ck") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('ltiTwL0V5ck');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_GROUP_ITEM_0073
     * @tc.name      Location_CityPickerStateSelectGroupItem_0073
     * @tc.desc      CityPickerState.selectGroupItem(name="eZLwP") yields "eZLwP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectGroupItem_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0073 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectGroupItem('eZLwP');
      logInfo(`selectGroupItem(name="eZLwP"): actual=${actual}`);
      expect(actual).assertEqual('eZLwP');
      logInfo(`selectGroupItem(name="eZLwP") state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('eZLwP');
      logInfo(`selectGroupItem(name="eZLwP") state: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('eZLwP');
      logInfo(`${BUNDLE}CityPickerStateSelectGroupItem_0073 end`);
    });
  });
}
