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

/** Logic checks for dragParamsText (39 cases). */
export default function dragParamsText2Test(): void {
  describe('DragParamsText2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0097
     * @tc.name      DragAndExchange_DragParamsText_0097
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=3) returns "{?"insertIndex?":3,?"selectedIndex?":-1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0097 begin`);
      const actual: string = dragParamsText(-1, 3);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":3,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0098
     * @tc.name      DragAndExchange_DragParamsText_0098
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=100) returns "{?"insertIndex?":100,?"selectedIndex?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0098 begin`);
      const actual: string = dragParamsText(-1, 100);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":100,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0099
     * @tc.name      DragAndExchange_DragParamsText_0099
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=15) returns "{?"insertIndex?":15,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0099 begin`);
      const actual: string = dragParamsText(-1, 15);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":15,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0100
     * @tc.name      DragAndExchange_DragParamsText_0100
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=20) returns "{?"insertIndex?":20,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0100 begin`);
      const actual: string = dragParamsText(-1, 20);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":20,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0101
     * @tc.name      DragAndExchange_DragParamsText_0101
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=25) returns "{?"insertIndex?":25,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0101 begin`);
      const actual: string = dragParamsText(-1, 25);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":25,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0102
     * @tc.name      DragAndExchange_DragParamsText_0102
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=30) returns "{?"insertIndex?":30,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0102 begin`);
      const actual: string = dragParamsText(-1, 30);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":30,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0103
     * @tc.name      DragAndExchange_DragParamsText_0103
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=35) returns "{?"insertIndex?":35,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0103 begin`);
      const actual: string = dragParamsText(-1, 35);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":35,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0104
     * @tc.name      DragAndExchange_DragParamsText_0104
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=40) returns "{?"insertIndex?":40,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0104 begin`);
      const actual: string = dragParamsText(-1, 40);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":40,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0105
     * @tc.name      DragAndExchange_DragParamsText_0105
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=45) returns "{?"insertIndex?":45,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0105 begin`);
      const actual: string = dragParamsText(-1, 45);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":45,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0106
     * @tc.name      DragAndExchange_DragParamsText_0106
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=50) returns "{?"insertIndex?":50,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0106 begin`);
      const actual: string = dragParamsText(-1, 50);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":50,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0107
     * @tc.name      DragAndExchange_DragParamsText_0107
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=55) returns "{?"insertIndex?":55,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0107 begin`);
      const actual: string = dragParamsText(-1, 55);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":55,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0108
     * @tc.name      DragAndExchange_DragParamsText_0108
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=60) returns "{?"insertIndex?":60,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0108 begin`);
      const actual: string = dragParamsText(-1, 60);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":60,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0109
     * @tc.name      DragAndExchange_DragParamsText_0109
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=65) returns "{?"insertIndex?":65,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0109 begin`);
      const actual: string = dragParamsText(-1, 65);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":65,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0110
     * @tc.name      DragAndExchange_DragParamsText_0110
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=70) returns "{?"insertIndex?":70,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0110 begin`);
      const actual: string = dragParamsText(-1, 70);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":70,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0111
     * @tc.name      DragAndExchange_DragParamsText_0111
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=75) returns "{?"insertIndex?":75,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0111 begin`);
      const actual: string = dragParamsText(-1, 75);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":75,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0112
     * @tc.name      DragAndExchange_DragParamsText_0112
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=80) returns "{?"insertIndex?":80,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0112 begin`);
      const actual: string = dragParamsText(-1, 80);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":80,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0113
     * @tc.name      DragAndExchange_DragParamsText_0113
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=85) returns "{?"insertIndex?":85,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0113 begin`);
      const actual: string = dragParamsText(-1, 85);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":85,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0114
     * @tc.name      DragAndExchange_DragParamsText_0114
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=90) returns "{?"insertIndex?":90,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0114 begin`);
      const actual: string = dragParamsText(-1, 90);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":90,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0115
     * @tc.name      DragAndExchange_DragParamsText_0115
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=95) returns "{?"insertIndex?":95,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0115 begin`);
      const actual: string = dragParamsText(-1, 95);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":95,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0116
     * @tc.name      DragAndExchange_DragParamsText_0116
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=105) returns "{?"insertIndex?":105,?"selectedIndex?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0116 begin`);
      const actual: string = dragParamsText(-1, 105);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":105,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0117
     * @tc.name      DragAndExchange_DragParamsText_0117
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=110) returns "{?"insertIndex?":110,?"selectedIndex?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0117 begin`);
      const actual: string = dragParamsText(-1, 110);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":110,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0118
     * @tc.name      DragAndExchange_DragParamsText_0118
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=134) returns "{?"insertIndex?":134,?"selectedIndex?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0118 begin`);
      const actual: string = dragParamsText(-1, 134);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":134,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0119
     * @tc.name      DragAndExchange_DragParamsText_0119
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=-7) returns "{?"insertIndex?":-7,?"selectedIndex?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0119 begin`);
      const actual: string = dragParamsText(-1, -7);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":-7,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0120
     * @tc.name      DragAndExchange_DragParamsText_0120
     * @tc.desc      dragParamsText(selectedIndex=-1, insertIndex=104) returns "{?"insertIndex?":104,?"selectedIndex?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0120 begin`);
      const actual: string = dragParamsText(-1, 104);
      logInfo(`dragParamsText(selectedIndex=-1, insertIn...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":104,"selectedIndex":-1}');
      logInfo(`${BUNDLE}DragParamsText_0120 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0121
     * @tc.name      DragAndExchange_DragParamsText_0121
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=0) returns "{?"insertIndex?":0,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0121 begin`);
      const actual: string = dragParamsText(5, 0);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":0,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0121 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0122
     * @tc.name      DragAndExchange_DragParamsText_0122
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=1) returns "{?"insertIndex?":1,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0122 begin`);
      const actual: string = dragParamsText(5, 1);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":1,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0122 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0123
     * @tc.name      DragAndExchange_DragParamsText_0123
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=2) returns "{?"insertIndex?":2,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0123 begin`);
      const actual: string = dragParamsText(5, 2);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":2,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0123 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0124
     * @tc.name      DragAndExchange_DragParamsText_0124
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=-1) returns "{?"insertIndex?":-1,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_DragParamsText_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0124 begin`);
      const actual: string = dragParamsText(5, -1);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":-1,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0124 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0125
     * @tc.name      DragAndExchange_DragParamsText_0125
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=5) returns "{?"insertIndex?":5,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0125 begin`);
      const actual: string = dragParamsText(5, 5);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":5,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0125 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0126
     * @tc.name      DragAndExchange_DragParamsText_0126
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=10) returns "{?"insertIndex?":10,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0126 begin`);
      const actual: string = dragParamsText(5, 10);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":10,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0126 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0127
     * @tc.name      DragAndExchange_DragParamsText_0127
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=3) returns "{?"insertIndex?":3,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0127 begin`);
      const actual: string = dragParamsText(5, 3);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":3,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0127 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0128
     * @tc.name      DragAndExchange_DragParamsText_0128
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=100) returns "{?"insertIndex?":100,?"selectedIndex?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0128 begin`);
      const actual: string = dragParamsText(5, 100);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":100,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0128 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0129
     * @tc.name      DragAndExchange_DragParamsText_0129
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=15) returns "{?"insertIndex?":15,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0129 begin`);
      const actual: string = dragParamsText(5, 15);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":15,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0129 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0130
     * @tc.name      DragAndExchange_DragParamsText_0130
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=20) returns "{?"insertIndex?":20,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0130 begin`);
      const actual: string = dragParamsText(5, 20);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":20,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0130 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0131
     * @tc.name      DragAndExchange_DragParamsText_0131
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=25) returns "{?"insertIndex?":25,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0131 begin`);
      const actual: string = dragParamsText(5, 25);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":25,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0131 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0132
     * @tc.name      DragAndExchange_DragParamsText_0132
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=30) returns "{?"insertIndex?":30,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0132 begin`);
      const actual: string = dragParamsText(5, 30);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":30,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0132 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0133
     * @tc.name      DragAndExchange_DragParamsText_0133
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=35) returns "{?"insertIndex?":35,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0133 begin`);
      const actual: string = dragParamsText(5, 35);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":35,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0133 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0134
     * @tc.name      DragAndExchange_DragParamsText_0134
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=40) returns "{?"insertIndex?":40,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0134 begin`);
      const actual: string = dragParamsText(5, 40);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":40,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0134 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DRAG_PARAMS_TEXT_0135
     * @tc.name      DragAndExchange_DragParamsText_0135
     * @tc.desc      dragParamsText(selectedIndex=5, insertIndex=45) returns "{?"insertIndex?":45,?"selectedIndex?":5}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DragParamsText_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DragParamsText_0135 begin`);
      const actual: string = dragParamsText(5, 45);
      logInfo(`dragParamsText(selectedIndex=5, insertInd...: actual=${actual}`);
      expect(actual).assertEqual('{"insertIndex":45,"selectedIndex":5}');
      logInfo(`${BUNDLE}DragParamsText_0135 end`);
    });
  });
}
