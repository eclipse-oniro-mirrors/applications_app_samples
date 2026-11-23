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
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { appUriOf } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for appUriOf (30 cases). */
export default function appUriOfTest(): void {
  describe('AppUriOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0001
     * @tc.name      SearchComponent_AppUriOf_0001
     * @tc.desc      appUriOf(name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_AppUriOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppUriOf_0001 begin`);
      const actual: string = appUriOf('');
      logInfo(`appUriOf(name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0002
     * @tc.name      SearchComponent_AppUriOf_0002
     * @tc.desc      appUriOf(name="x") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_AppUriOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppUriOf_0002 begin`);
      const actual: string = appUriOf('x');
      logInfo(`appUriOf(name="x"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0003
     * @tc.name      SearchComponent_AppUriOf_0003
     * @tc.desc      appUriOf(name="Hello") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0003 begin`);
      const actual: string = appUriOf('Hello');
      logInfo(`appUriOf(name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0004
     * @tc.name      SearchComponent_AppUriOf_0004
     * @tc.desc      appUriOf(name="hello world") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0004 begin`);
      const actual: string = appUriOf('hello world');
      logInfo(`appUriOf(name="hello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0005
     * @tc.name      SearchComponent_AppUriOf_0005
     * @tc.desc      appUriOf(name=" ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0005 begin`);
      const actual: string = appUriOf(' ');
      logInfo(`appUriOf(name=" "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0006
     * @tc.name      SearchComponent_AppUriOf_0006
     * @tc.desc      appUriOf(name="A") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0006 begin`);
      const actual: string = appUriOf('A');
      logInfo(`appUriOf(name="A"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0007
     * @tc.name      SearchComponent_AppUriOf_0007
     * @tc.desc      appUriOf(name="Sample Title 123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0007 begin`);
      const actual: string = appUriOf('Sample Title 123');
      logInfo(`appUriOf(name="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0008
     * @tc.name      SearchComponent_AppUriOf_0008
     * @tc.desc      appUriOf(name="??") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0008 begin`);
      const actual: string = appUriOf('\u4e2d\u6587');
      logInfo(`appUriOf(name="??"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0009
     * @tc.name      SearchComponent_AppUriOf_0009
     * @tc.desc      appUriOf(name="a") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0009 begin`);
      const actual: string = appUriOf('a');
      logInfo(`appUriOf(name="a"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0010
     * @tc.name      SearchComponent_AppUriOf_0010
     * @tc.desc      appUriOf(name="abc") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0010 begin`);
      const actual: string = appUriOf('abc');
      logInfo(`appUriOf(name="abc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0011
     * @tc.name      SearchComponent_AppUriOf_0011
     * @tc.desc      appUriOf(name="Hello World") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0011 begin`);
      const actual: string = appUriOf('Hello World');
      logInfo(`appUriOf(name="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0012
     * @tc.name      SearchComponent_AppUriOf_0012
     * @tc.desc      appUriOf(name="123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0012 begin`);
      const actual: string = appUriOf('123');
      logInfo(`appUriOf(name="123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0013
     * @tc.name      SearchComponent_AppUriOf_0013
     * @tc.desc      appUriOf(name=" x ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AppUriOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppUriOf_0013 begin`);
      const actual: string = appUriOf(' x ');
      logInfo(`appUriOf(name=" x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0014
     * @tc.name      SearchComponent_AppUriOf_0014
     * @tc.desc      appUriOf(name="xx") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0014 begin`);
      const actual: string = appUriOf('xx');
      logInfo(`appUriOf(name="xx"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0015
     * @tc.name      SearchComponent_AppUriOf_0015
     * @tc.desc      appUriOf(name="x_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0015 begin`);
      const actual: string = appUriOf('x_1');
      logInfo(`appUriOf(name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0016
     * @tc.name      SearchComponent_AppUriOf_0016
     * @tc.desc      appUriOf(name=" Hello ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AppUriOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppUriOf_0016 begin`);
      const actual: string = appUriOf(' Hello ');
      logInfo(`appUriOf(name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0017
     * @tc.name      SearchComponent_AppUriOf_0017
     * @tc.desc      appUriOf(name="HelloHello") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0017 begin`);
      const actual: string = appUriOf('HelloHello');
      logInfo(`appUriOf(name="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0018
     * @tc.name      SearchComponent_AppUriOf_0018
     * @tc.desc      appUriOf(name="Hello_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0018 begin`);
      const actual: string = appUriOf('Hello_1');
      logInfo(`appUriOf(name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0019
     * @tc.name      SearchComponent_AppUriOf_0019
     * @tc.desc      appUriOf(name="xHello") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AppUriOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppUriOf_0019 begin`);
      const actual: string = appUriOf('xHello');
      logInfo(`appUriOf(name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0020
     * @tc.name      SearchComponent_AppUriOf_0020
     * @tc.desc      appUriOf(name=" hello world ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AppUriOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppUriOf_0020 begin`);
      const actual: string = appUriOf(' hello world ');
      logInfo(`appUriOf(name=" hello world "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0021
     * @tc.name      SearchComponent_AppUriOf_0021
     * @tc.desc      appUriOf(name="hello worldhello world") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0021 begin`);
      const actual: string = appUriOf('hello worldhello world');
      logInfo(`appUriOf(name="hello worldhello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0022
     * @tc.name      SearchComponent_AppUriOf_0022
     * @tc.desc      appUriOf(name="hello world_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0022 begin`);
      const actual: string = appUriOf('hello world_1');
      logInfo(`appUriOf(name="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0023
     * @tc.name      SearchComponent_AppUriOf_0023
     * @tc.desc      appUriOf(name="xhello world") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AppUriOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppUriOf_0023 begin`);
      const actual: string = appUriOf('xhello world');
      logInfo(`appUriOf(name="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0024
     * @tc.name      SearchComponent_AppUriOf_0024
     * @tc.desc      appUriOf(name="   ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AppUriOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppUriOf_0024 begin`);
      const actual: string = appUriOf('   ');
      logInfo(`appUriOf(name="   "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0025
     * @tc.name      SearchComponent_AppUriOf_0025
     * @tc.desc      appUriOf(name="  ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0025 begin`);
      const actual: string = appUriOf('  ');
      logInfo(`appUriOf(name="  "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0026
     * @tc.name      SearchComponent_AppUriOf_0026
     * @tc.desc      appUriOf(name=" _1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0026 begin`);
      const actual: string = appUriOf(' _1');
      logInfo(`appUriOf(name=" _1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0027
     * @tc.name      SearchComponent_AppUriOf_0027
     * @tc.desc      appUriOf(name="x ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AppUriOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppUriOf_0027 begin`);
      const actual: string = appUriOf('x ');
      logInfo(`appUriOf(name="x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0028
     * @tc.name      SearchComponent_AppUriOf_0028
     * @tc.desc      appUriOf(name=" A ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_AppUriOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppUriOf_0028 begin`);
      const actual: string = appUriOf(' A ');
      logInfo(`appUriOf(name=" A "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0029
     * @tc.name      SearchComponent_AppUriOf_0029
     * @tc.desc      appUriOf(name="AA") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0029 begin`);
      const actual: string = appUriOf('AA');
      logInfo(`appUriOf(name="AA"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_APP_URI_OF_0030
     * @tc.name      SearchComponent_AppUriOf_0030
     * @tc.desc      appUriOf(name="A_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_AppUriOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppUriOf_0030 begin`);
      const actual: string = appUriOf('A_1');
      logInfo(`appUriOf(name="A_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}AppUriOf_0030 end`);
    });
  });
}
