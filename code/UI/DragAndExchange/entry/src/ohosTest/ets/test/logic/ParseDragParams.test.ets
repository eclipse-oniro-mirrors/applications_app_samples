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
import { DragParams, parseDragParams } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for parseDragParams (30 cases). */
export default function parseDragParamsTest(): void {
  describe('ParseDragParamsTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0001
     * @tc.name      DragAndExchange_ParseDragParams_0001
     * @tc.desc      parseDragParams(extraParams="object") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ParseDragParams_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0001 begin`);
      const actual: DragParams = parseDragParams('object');
      logInfo(`parseDragParams(extraParams="object"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="object"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0002
     * @tc.name      DragAndExchange_ParseDragParams_0002
     * @tc.desc      parseDragParams(extraParams="number") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ParseDragParams_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0002 begin`);
      const actual: DragParams = parseDragParams('number');
      logInfo(`parseDragParams(extraParams="number"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="number"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0003
     * @tc.name      DragAndExchange_ParseDragParams_0003
     * @tc.desc      parseDragParams(extraParams="OBJECT") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0003 begin`);
      const actual: DragParams = parseDragParams('OBJECT');
      logInfo(`parseDragParams(extraParams="OBJECT"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="OBJECT"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0004
     * @tc.name      DragAndExchange_ParseDragParams_0004
     * @tc.desc      parseDragParams(extraParams="objec") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0004 begin`);
      const actual: DragParams = parseDragParams('objec');
      logInfo(`parseDragParams(extraParams="objec"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="objec"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0005
     * @tc.name      DragAndExchange_ParseDragParams_0005
     * @tc.desc      parseDragParams(extraParams="objectx") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0005 begin`);
      const actual: DragParams = parseDragParams('objectx');
      logInfo(`parseDragParams(extraParams="objectx"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="objectx"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0006
     * @tc.name      DragAndExchange_ParseDragParams_0006
     * @tc.desc      parseDragParams(extraParams="NUMBER") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0006 begin`);
      const actual: DragParams = parseDragParams('NUMBER');
      logInfo(`parseDragParams(extraParams="NUMBER"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="NUMBER"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0007
     * @tc.name      DragAndExchange_ParseDragParams_0007
     * @tc.desc      parseDragParams(extraParams="numbe") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0007 begin`);
      const actual: DragParams = parseDragParams('numbe');
      logInfo(`parseDragParams(extraParams="numbe"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="numbe"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0008
     * @tc.name      DragAndExchange_ParseDragParams_0008
     * @tc.desc      parseDragParams(extraParams="numberx") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0008 begin`);
      const actual: DragParams = parseDragParams('numberx');
      logInfo(`parseDragParams(extraParams="numberx"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="numberx"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0009
     * @tc.name      DragAndExchange_ParseDragParams_0009
     * @tc.desc      parseDragParams(extraParams="") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0009 begin`);
      const actual: DragParams = parseDragParams('');
      logInfo(`parseDragParams(extraParams=""): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams=""): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0010
     * @tc.name      DragAndExchange_ParseDragParams_0010
     * @tc.desc      parseDragParams(extraParams="a") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0010 begin`);
      const actual: DragParams = parseDragParams('a');
      logInfo(`parseDragParams(extraParams="a"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="a"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0011
     * @tc.name      DragAndExchange_ParseDragParams_0011
     * @tc.desc      parseDragParams(extraParams="abc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0011 begin`);
      const actual: DragParams = parseDragParams('abc');
      logInfo(`parseDragParams(extraParams="abc"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="abc"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0012
     * @tc.name      DragAndExchange_ParseDragParams_0012
     * @tc.desc      parseDragParams(extraParams="Hello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0012 begin`);
      const actual: DragParams = parseDragParams('Hello World');
      logInfo(`parseDragParams(extraParams="Hello World"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="Hello World"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0013
     * @tc.name      DragAndExchange_ParseDragParams_0013
     * @tc.desc      parseDragParams(extraParams=" ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0013 begin`);
      const actual: DragParams = parseDragParams(' ');
      logInfo(`parseDragParams(extraParams=" "): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams=" "): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0014
     * @tc.name      DragAndExchange_ParseDragParams_0014
     * @tc.desc      parseDragParams(extraParams="123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0014 begin`);
      const actual: DragParams = parseDragParams('123');
      logInfo(`parseDragParams(extraParams="123"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="123"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0015
     * @tc.name      DragAndExchange_ParseDragParams_0015
     * @tc.desc      parseDragParams(extraParams=" object ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0015 begin`);
      const actual: DragParams = parseDragParams(' object ');
      logInfo(`parseDragParams(extraParams=" object "): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams=" object "): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0016
     * @tc.name      DragAndExchange_ParseDragParams_0016
     * @tc.desc      parseDragParams(extraParams="objectobject") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0016 begin`);
      const actual: DragParams = parseDragParams('objectobject');
      logInfo(`parseDragParams(extraParams="objectobject"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="objectobject"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0017
     * @tc.name      DragAndExchange_ParseDragParams_0017
     * @tc.desc      parseDragParams(extraParams="object_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0017 begin`);
      const actual: DragParams = parseDragParams('object_1');
      logInfo(`parseDragParams(extraParams="object_1"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="object_1"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0018
     * @tc.name      DragAndExchange_ParseDragParams_0018
     * @tc.desc      parseDragParams(extraParams="xobject") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0018 begin`);
      const actual: DragParams = parseDragParams('xobject');
      logInfo(`parseDragParams(extraParams="xobject"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="xobject"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0019
     * @tc.name      DragAndExchange_ParseDragParams_0019
     * @tc.desc      parseDragParams(extraParams=" number ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0019 begin`);
      const actual: DragParams = parseDragParams(' number ');
      logInfo(`parseDragParams(extraParams=" number "): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams=" number "): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0020
     * @tc.name      DragAndExchange_ParseDragParams_0020
     * @tc.desc      parseDragParams(extraParams="numbernumber") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0020 begin`);
      const actual: DragParams = parseDragParams('numbernumber');
      logInfo(`parseDragParams(extraParams="numbernumber"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="numbernumber"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0021
     * @tc.name      DragAndExchange_ParseDragParams_0021
     * @tc.desc      parseDragParams(extraParams="number_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0021 begin`);
      const actual: DragParams = parseDragParams('number_1');
      logInfo(`parseDragParams(extraParams="number_1"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="number_1"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0022
     * @tc.name      DragAndExchange_ParseDragParams_0022
     * @tc.desc      parseDragParams(extraParams="xnumber") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0022 begin`);
      const actual: DragParams = parseDragParams('xnumber');
      logInfo(`parseDragParams(extraParams="xnumber"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="xnumber"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0023
     * @tc.name      DragAndExchange_ParseDragParams_0023
     * @tc.desc      parseDragParams(extraParams=" OBJECT ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0023 begin`);
      const actual: DragParams = parseDragParams(' OBJECT ');
      logInfo(`parseDragParams(extraParams=" OBJECT "): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams=" OBJECT "): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0024
     * @tc.name      DragAndExchange_ParseDragParams_0024
     * @tc.desc      parseDragParams(extraParams="OBJECTOBJECT") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0024 begin`);
      const actual: DragParams = parseDragParams('OBJECTOBJECT');
      logInfo(`parseDragParams(extraParams="OBJECTOBJECT"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="OBJECTOBJECT"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0025
     * @tc.name      DragAndExchange_ParseDragParams_0025
     * @tc.desc      parseDragParams(extraParams="OBJECT_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0025 begin`);
      const actual: DragParams = parseDragParams('OBJECT_1');
      logInfo(`parseDragParams(extraParams="OBJECT_1"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="OBJECT_1"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0026
     * @tc.name      DragAndExchange_ParseDragParams_0026
     * @tc.desc      parseDragParams(extraParams="xOBJECT") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0026 begin`);
      const actual: DragParams = parseDragParams('xOBJECT');
      logInfo(`parseDragParams(extraParams="xOBJECT"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="xOBJECT"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0027
     * @tc.name      DragAndExchange_ParseDragParams_0027
     * @tc.desc      parseDragParams(extraParams=" objec ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0027 begin`);
      const actual: DragParams = parseDragParams(' objec ');
      logInfo(`parseDragParams(extraParams=" objec "): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams=" objec "): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0028
     * @tc.name      DragAndExchange_ParseDragParams_0028
     * @tc.desc      parseDragParams(extraParams="objecobjec") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0028 begin`);
      const actual: DragParams = parseDragParams('objecobjec');
      logInfo(`parseDragParams(extraParams="objecobjec"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="objecobjec"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0029
     * @tc.name      DragAndExchange_ParseDragParams_0029
     * @tc.desc      parseDragParams(extraParams="objec_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ParseDragParams_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0029 begin`);
      const actual: DragParams = parseDragParams('objec_1');
      logInfo(`parseDragParams(extraParams="objec_1"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="objec_1"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_PARSE_DRAG_PARAMS_0030
     * @tc.name      DragAndExchange_ParseDragParams_0030
     * @tc.desc      parseDragParams(extraParams="xobjec") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ParseDragParams_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ParseDragParams_0030 begin`);
      const actual: DragParams = parseDragParams('xobjec');
      logInfo(`parseDragParams(extraParams="xobjec"): actual.insertIndex=${actual.insertIndex}`);
      expect(actual.insertIndex).assertEqual(-1);
      logInfo(`parseDragParams(extraParams="xobjec"): actual.selectedIndex=${actual.selectedIndex}`);
      expect(actual.selectedIndex).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDragParams_0030 end`);
    });
  });
}
