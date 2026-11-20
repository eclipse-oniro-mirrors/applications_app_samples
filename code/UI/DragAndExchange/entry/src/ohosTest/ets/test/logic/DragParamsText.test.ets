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
import { dragParamsText } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dragParamsText (96 cases). */
export default function dragParamsTextTest(): void {
  describe('DragParamsTextTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0001
     * @tc.name      DragAndExchange_DragParamsText_0001
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=0) returns "{?"insertIndex?":0,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DragParamsText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0001 begin`);
      const actual: string = dragParamsText(0, 0);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":0,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0002
     * @tc.name      DragAndExchange_DragParamsText_0002
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=1) returns "{?"insertIndex?":1,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DragParamsText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0002 begin`);
      const actual: string = dragParamsText(0, 1);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":1,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0003
     * @tc.name      DragAndExchange_DragParamsText_0003
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=2) returns "{?"insertIndex?":2,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0003 begin`);
      const actual: string = dragParamsText(0, 2);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":2,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0004
     * @tc.name      DragAndExchange_DragParamsText_0004
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=-1) returns "{?"insertIndex?":-1,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0004 begin`);
      const actual: string = dragParamsText(0, -1);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":-1,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0005
     * @tc.name      DragAndExchange_DragParamsText_0005
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=5) returns "{?"insertIndex?":5,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0005 begin`);
      const actual: string = dragParamsText(0, 5);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":5,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0006
     * @tc.name      DragAndExchange_DragParamsText_0006
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=10) returns "{?"insertIndex?":10,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0006 begin`);
      const actual: string = dragParamsText(0, 10);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":10,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0007
     * @tc.name      DragAndExchange_DragParamsText_0007
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=3) returns "{?"insertIndex?":3,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0007 begin`);
      const actual: string = dragParamsText(0, 3);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":3,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0008
     * @tc.name      DragAndExchange_DragParamsText_0008
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=100) returns "{?"insertIndex?":100,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0008 begin`);
      const actual: string = dragParamsText(0, 100);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":100,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0009
     * @tc.name      DragAndExchange_DragParamsText_0009
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=15) returns "{?"insertIndex?":15,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0009 begin`);
      const actual: string = dragParamsText(0, 15);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":15,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0010
     * @tc.name      DragAndExchange_DragParamsText_0010
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=20) returns "{?"insertIndex?":20,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0010 begin`);
      const actual: string = dragParamsText(0, 20);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":20,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0011
     * @tc.name      DragAndExchange_DragParamsText_0011
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=25) returns "{?"insertIndex?":25,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0011 begin`);
      const actual: string = dragParamsText(0, 25);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":25,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0012
     * @tc.name      DragAndExchange_DragParamsText_0012
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=30) returns "{?"insertIndex?":30,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0012 begin`);
      const actual: string = dragParamsText(0, 30);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":30,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0013
     * @tc.name      DragAndExchange_DragParamsText_0013
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=35) returns "{?"insertIndex?":35,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0013 begin`);
      const actual: string = dragParamsText(0, 35);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":35,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0014
     * @tc.name      DragAndExchange_DragParamsText_0014
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=40) returns "{?"insertIndex?":40,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0014 begin`);
      const actual: string = dragParamsText(0, 40);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":40,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0015
     * @tc.name      DragAndExchange_DragParamsText_0015
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=45) returns "{?"insertIndex?":45,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0015 begin`);
      const actual: string = dragParamsText(0, 45);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":45,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0016
     * @tc.name      DragAndExchange_DragParamsText_0016
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=50) returns "{?"insertIndex?":50,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0016 begin`);
      const actual: string = dragParamsText(0, 50);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":50,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0017
     * @tc.name      DragAndExchange_DragParamsText_0017
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=55) returns "{?"insertIndex?":55,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0017 begin`);
      const actual: string = dragParamsText(0, 55);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":55,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0018
     * @tc.name      DragAndExchange_DragParamsText_0018
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=60) returns "{?"insertIndex?":60,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0018 begin`);
      const actual: string = dragParamsText(0, 60);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":60,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0019
     * @tc.name      DragAndExchange_DragParamsText_0019
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=65) returns "{?"insertIndex?":65,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0019 begin`);
      const actual: string = dragParamsText(0, 65);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":65,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0020
     * @tc.name      DragAndExchange_DragParamsText_0020
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=70) returns "{?"insertIndex?":70,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0020 begin`);
      const actual: string = dragParamsText(0, 70);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":70,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0021
     * @tc.name      DragAndExchange_DragParamsText_0021
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=75) returns "{?"insertIndex?":75,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0021 begin`);
      const actual: string = dragParamsText(0, 75);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":75,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0022
     * @tc.name      DragAndExchange_DragParamsText_0022
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=80) returns "{?"insertIndex?":80,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0022 begin`);
      const actual: string = dragParamsText(0, 80);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":80,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0023
     * @tc.name      DragAndExchange_DragParamsText_0023
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=85) returns "{?"insertIndex?":85,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0023 begin`);
      const actual: string = dragParamsText(0, 85);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":85,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0024
     * @tc.name      DragAndExchange_DragParamsText_0024
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=90) returns "{?"insertIndex?":90,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0024 begin`);
      const actual: string = dragParamsText(0, 90);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":90,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0025
     * @tc.name      DragAndExchange_DragParamsText_0025
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=95) returns "{?"insertIndex?":95,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0025 begin`);
      const actual: string = dragParamsText(0, 95);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":95,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0026
     * @tc.name      DragAndExchange_DragParamsText_0026
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=105) returns "{?"insertIndex?":105,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0026 begin`);
      const actual: string = dragParamsText(0, 105);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":105,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0027
     * @tc.name      DragAndExchange_DragParamsText_0027
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=110) returns "{?"insertIndex?":110,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0027 begin`);
      const actual: string = dragParamsText(0, 110);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":110,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0028
     * @tc.name      DragAndExchange_DragParamsText_0028
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=134) returns "{?"insertIndex?":134,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0028 begin`);
      const actual: string = dragParamsText(0, 134);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":134,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0029
     * @tc.name      DragAndExchange_DragParamsText_0029
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=-7) returns "{?"insertIndex?":-7,?"selectedIndex?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0029 begin`);
      const actual: string = dragParamsText(0, -7);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":-7,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0030
     * @tc.name      DragAndExchange_DragParamsText_0030
     * @tc.desc      dragParamsText(selectedIndex=0, insertIndex=104) returns "{?"insertIndex?":104,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0030 begin`);
      const actual: string = dragParamsText(0, 104);
      logInfo(`dragParamsText(selectedIndex=0, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":104,"selectedIndex":0}');
      logInfo(`${BUNDLE}DragParamsText_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0031
     * @tc.name      DragAndExchange_DragParamsText_0031
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=0) returns "{?"insertIndex?":0,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0031 begin`);
      const actual: string = dragParamsText(1, 0);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":0,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0032
     * @tc.name      DragAndExchange_DragParamsText_0032
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=1) returns "{?"insertIndex?":1,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0032 begin`);
      const actual: string = dragParamsText(1, 1);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":1,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0033
     * @tc.name      DragAndExchange_DragParamsText_0033
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=2) returns "{?"insertIndex?":2,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0033 begin`);
      const actual: string = dragParamsText(1, 2);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":2,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0034
     * @tc.name      DragAndExchange_DragParamsText_0034
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=-1) returns "{?"insertIndex?":-1,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0034 begin`);
      const actual: string = dragParamsText(1, -1);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":-1,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0035
     * @tc.name      DragAndExchange_DragParamsText_0035
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=5) returns "{?"insertIndex?":5,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0035 begin`);
      const actual: string = dragParamsText(1, 5);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":5,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0036
     * @tc.name      DragAndExchange_DragParamsText_0036
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=10) returns "{?"insertIndex?":10,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0036 begin`);
      const actual: string = dragParamsText(1, 10);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":10,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0037
     * @tc.name      DragAndExchange_DragParamsText_0037
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=3) returns "{?"insertIndex?":3,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0037 begin`);
      const actual: string = dragParamsText(1, 3);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":3,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0038
     * @tc.name      DragAndExchange_DragParamsText_0038
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=100) returns "{?"insertIndex?":100,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0038 begin`);
      const actual: string = dragParamsText(1, 100);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":100,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0039
     * @tc.name      DragAndExchange_DragParamsText_0039
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=15) returns "{?"insertIndex?":15,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0039 begin`);
      const actual: string = dragParamsText(1, 15);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":15,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0040
     * @tc.name      DragAndExchange_DragParamsText_0040
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=20) returns "{?"insertIndex?":20,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0040 begin`);
      const actual: string = dragParamsText(1, 20);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":20,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0041
     * @tc.name      DragAndExchange_DragParamsText_0041
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=25) returns "{?"insertIndex?":25,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0041 begin`);
      const actual: string = dragParamsText(1, 25);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":25,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0042
     * @tc.name      DragAndExchange_DragParamsText_0042
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=30) returns "{?"insertIndex?":30,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0042 begin`);
      const actual: string = dragParamsText(1, 30);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":30,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0043
     * @tc.name      DragAndExchange_DragParamsText_0043
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=35) returns "{?"insertIndex?":35,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0043 begin`);
      const actual: string = dragParamsText(1, 35);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":35,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0044
     * @tc.name      DragAndExchange_DragParamsText_0044
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=40) returns "{?"insertIndex?":40,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0044 begin`);
      const actual: string = dragParamsText(1, 40);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":40,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0045
     * @tc.name      DragAndExchange_DragParamsText_0045
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=45) returns "{?"insertIndex?":45,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0045 begin`);
      const actual: string = dragParamsText(1, 45);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":45,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0046
     * @tc.name      DragAndExchange_DragParamsText_0046
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=50) returns "{?"insertIndex?":50,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0046 begin`);
      const actual: string = dragParamsText(1, 50);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":50,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0047
     * @tc.name      DragAndExchange_DragParamsText_0047
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=55) returns "{?"insertIndex?":55,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0047 begin`);
      const actual: string = dragParamsText(1, 55);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":55,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0048
     * @tc.name      DragAndExchange_DragParamsText_0048
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=60) returns "{?"insertIndex?":60,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0048 begin`);
      const actual: string = dragParamsText(1, 60);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":60,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0049
     * @tc.name      DragAndExchange_DragParamsText_0049
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=65) returns "{?"insertIndex?":65,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0049 begin`);
      const actual: string = dragParamsText(1, 65);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":65,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0050
     * @tc.name      DragAndExchange_DragParamsText_0050
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=70) returns "{?"insertIndex?":70,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0050 begin`);
      const actual: string = dragParamsText(1, 70);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":70,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0051
     * @tc.name      DragAndExchange_DragParamsText_0051
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=75) returns "{?"insertIndex?":75,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0051 begin`);
      const actual: string = dragParamsText(1, 75);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":75,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0052
     * @tc.name      DragAndExchange_DragParamsText_0052
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=80) returns "{?"insertIndex?":80,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0052 begin`);
      const actual: string = dragParamsText(1, 80);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":80,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0053
     * @tc.name      DragAndExchange_DragParamsText_0053
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=85) returns "{?"insertIndex?":85,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0053 begin`);
      const actual: string = dragParamsText(1, 85);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":85,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0054
     * @tc.name      DragAndExchange_DragParamsText_0054
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=90) returns "{?"insertIndex?":90,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0054 begin`);
      const actual: string = dragParamsText(1, 90);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":90,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0055
     * @tc.name      DragAndExchange_DragParamsText_0055
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=95) returns "{?"insertIndex?":95,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0055 begin`);
      const actual: string = dragParamsText(1, 95);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":95,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0056
     * @tc.name      DragAndExchange_DragParamsText_0056
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=105) returns "{?"insertIndex?":105,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0056 begin`);
      const actual: string = dragParamsText(1, 105);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":105,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0057
     * @tc.name      DragAndExchange_DragParamsText_0057
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=110) returns "{?"insertIndex?":110,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0057 begin`);
      const actual: string = dragParamsText(1, 110);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":110,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0058
     * @tc.name      DragAndExchange_DragParamsText_0058
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=134) returns "{?"insertIndex?":134,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0058 begin`);
      const actual: string = dragParamsText(1, 134);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":134,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0059
     * @tc.name      DragAndExchange_DragParamsText_0059
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=-7) returns "{?"insertIndex?":-7,?"selectedIndex?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0059 begin`);
      const actual: string = dragParamsText(1, -7);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":-7,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0060
     * @tc.name      DragAndExchange_DragParamsText_0060
     * @tc.desc      dragParamsText(selectedIndex=1, insertIndex=104) returns "{?"insertIndex?":104,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0060 begin`);
      const actual: string = dragParamsText(1, 104);
      logInfo(`dragParamsText(selectedIndex=1, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":104,"selectedIndex":1}');
      logInfo(`${BUNDLE}DragParamsText_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0061
     * @tc.name      DragAndExchange_DragParamsText_0061
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=0) returns "{?"insertIndex?":0,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0061 begin`);
      const actual: string = dragParamsText(2, 0);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":0,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0062
     * @tc.name      DragAndExchange_DragParamsText_0062
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=1) returns "{?"insertIndex?":1,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0062 begin`);
      const actual: string = dragParamsText(2, 1);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":1,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0063
     * @tc.name      DragAndExchange_DragParamsText_0063
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=2) returns "{?"insertIndex?":2,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0063 begin`);
      const actual: string = dragParamsText(2, 2);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":2,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0064
     * @tc.name      DragAndExchange_DragParamsText_0064
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=-1) returns "{?"insertIndex?":-1,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0064 begin`);
      const actual: string = dragParamsText(2, -1);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":-1,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0065
     * @tc.name      DragAndExchange_DragParamsText_0065
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=5) returns "{?"insertIndex?":5,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0065 begin`);
      const actual: string = dragParamsText(2, 5);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":5,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0066
     * @tc.name      DragAndExchange_DragParamsText_0066
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=10) returns "{?"insertIndex?":10,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0066 begin`);
      const actual: string = dragParamsText(2, 10);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":10,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0067
     * @tc.name      DragAndExchange_DragParamsText_0067
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=3) returns "{?"insertIndex?":3,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0067 begin`);
      const actual: string = dragParamsText(2, 3);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":3,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0068
     * @tc.name      DragAndExchange_DragParamsText_0068
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=100) returns "{?"insertIndex?":100,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0068 begin`);
      const actual: string = dragParamsText(2, 100);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":100,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0069
     * @tc.name      DragAndExchange_DragParamsText_0069
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=15) returns "{?"insertIndex?":15,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0069 begin`);
      const actual: string = dragParamsText(2, 15);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":15,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0070
     * @tc.name      DragAndExchange_DragParamsText_0070
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=20) returns "{?"insertIndex?":20,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0070 begin`);
      const actual: string = dragParamsText(2, 20);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":20,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0071
     * @tc.name      DragAndExchange_DragParamsText_0071
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=25) returns "{?"insertIndex?":25,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0071 begin`);
      const actual: string = dragParamsText(2, 25);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":25,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0072
     * @tc.name      DragAndExchange_DragParamsText_0072
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=30) returns "{?"insertIndex?":30,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0072 begin`);
      const actual: string = dragParamsText(2, 30);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":30,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0073
     * @tc.name      DragAndExchange_DragParamsText_0073
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=35) returns "{?"insertIndex?":35,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0073 begin`);
      const actual: string = dragParamsText(2, 35);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":35,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0074
     * @tc.name      DragAndExchange_DragParamsText_0074
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=40) returns "{?"insertIndex?":40,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0074 begin`);
      const actual: string = dragParamsText(2, 40);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":40,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0075
     * @tc.name      DragAndExchange_DragParamsText_0075
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=45) returns "{?"insertIndex?":45,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0075 begin`);
      const actual: string = dragParamsText(2, 45);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":45,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0076
     * @tc.name      DragAndExchange_DragParamsText_0076
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=50) returns "{?"insertIndex?":50,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0076 begin`);
      const actual: string = dragParamsText(2, 50);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":50,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0077
     * @tc.name      DragAndExchange_DragParamsText_0077
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=55) returns "{?"insertIndex?":55,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0077 begin`);
      const actual: string = dragParamsText(2, 55);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":55,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0078
     * @tc.name      DragAndExchange_DragParamsText_0078
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=60) returns "{?"insertIndex?":60,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0078 begin`);
      const actual: string = dragParamsText(2, 60);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":60,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0079
     * @tc.name      DragAndExchange_DragParamsText_0079
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=65) returns "{?"insertIndex?":65,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0079 begin`);
      const actual: string = dragParamsText(2, 65);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":65,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0080
     * @tc.name      DragAndExchange_DragParamsText_0080
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=70) returns "{?"insertIndex?":70,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0080 begin`);
      const actual: string = dragParamsText(2, 70);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":70,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0081
     * @tc.name      DragAndExchange_DragParamsText_0081
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=75) returns "{?"insertIndex?":75,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0081 begin`);
      const actual: string = dragParamsText(2, 75);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":75,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0082
     * @tc.name      DragAndExchange_DragParamsText_0082
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=80) returns "{?"insertIndex?":80,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0082 begin`);
      const actual: string = dragParamsText(2, 80);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":80,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0083
     * @tc.name      DragAndExchange_DragParamsText_0083
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=85) returns "{?"insertIndex?":85,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0083 begin`);
      const actual: string = dragParamsText(2, 85);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":85,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0084
     * @tc.name      DragAndExchange_DragParamsText_0084
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=90) returns "{?"insertIndex?":90,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0084 begin`);
      const actual: string = dragParamsText(2, 90);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":90,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0085
     * @tc.name      DragAndExchange_DragParamsText_0085
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=95) returns "{?"insertIndex?":95,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0085 begin`);
      const actual: string = dragParamsText(2, 95);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":95,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0086
     * @tc.name      DragAndExchange_DragParamsText_0086
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=105) returns "{?"insertIndex?":105,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0086 begin`);
      const actual: string = dragParamsText(2, 105);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":105,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0087
     * @tc.name      DragAndExchange_DragParamsText_0087
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=110) returns "{?"insertIndex?":110,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0087 begin`);
      const actual: string = dragParamsText(2, 110);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":110,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0088
     * @tc.name      DragAndExchange_DragParamsText_0088
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=134) returns "{?"insertIndex?":134,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0088 begin`);
      const actual: string = dragParamsText(2, 134);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":134,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0089
     * @tc.name      DragAndExchange_DragParamsText_0089
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=-7) returns "{?"insertIndex?":-7,?"selectedIndex?":2}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0089 begin`);
      const actual: string = dragParamsText(2, -7);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":-7,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0090
     * @tc.name      DragAndExchange_DragParamsText_0090
     * @tc.desc      dragParamsText(selectedIndex=2, insertIndex=104) returns "{?"insertIndex?":104,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0090 begin`);
      const actual: string = dragParamsText(2, 104);
      logInfo(`dragParamsText(selectedIndex=2, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":104,"selectedIndex":2}');
      logInfo(`${BUNDLE}DragParamsText_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0091
     * @tc.name      DragAndExchange_DragParamsText_0091
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=0) returns "{?"insertIndex?":0,?"selectedIndex?":-1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0091 begin`);
      const actual: string = dragParamsText(-1, 0);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":0,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0092
     * @tc.name      DragAndExchange_DragParamsText_0092
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=1) returns "{?"insertIndex?":1,?"selectedIndex?":-1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0092 begin`);
      const actual: string = dragParamsText(-1, 1);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":1,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0093
     * @tc.name      DragAndExchange_DragParamsText_0093
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=2) returns "{?"insertIndex?":2,?"selectedIndex?":-1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0093 begin`);
      const actual: string = dragParamsText(-1, 2);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":2,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0094
     * @tc.name      DragAndExchange_DragParamsText_0094
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=-1) returns "{?"insertIndex?":-1,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0094 begin`);
      const actual: string = dragParamsText(-1, -1);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":-1,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0095
     * @tc.name      DragAndExchange_DragParamsText_0095
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=5) returns "{?"insertIndex?":5,?"selectedIndex?":-1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0095 begin`);
      const actual: string = dragParamsText(-1, 5);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":5,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0096
     * @tc.name      DragAndExchange_DragParamsText_0096
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=10) returns "{?"insertIndex?":10,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0096 begin`);
      const actual: string = dragParamsText(-1, 10);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":10,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0096 end`);
    });
  });
}
