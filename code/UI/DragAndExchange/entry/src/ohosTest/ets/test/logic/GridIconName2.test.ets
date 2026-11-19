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
import { gridIconName } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridIconName (24 cases). */
export default function gridIconName2Test(): void {
  describe('GridIconName2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0097
     * @tc.name      DragAndExchange_GridIconName_0097
     * @tc.desc      gridIconName(index=99) returns "drag_and_exchange_ic_public_app99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0097 begin`);
      const actual: string = gridIconName(99);
      logInfo(`gridIconName(index=99): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app99');
      logInfo(`${BUNDLE}GridIconName_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0098
     * @tc.name      DragAndExchange_GridIconName_0098
     * @tc.desc      gridIconName(index=39) returns "drag_and_exchange_ic_public_app39"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0098 begin`);
      const actual: string = gridIconName(39);
      logInfo(`gridIconName(index=39): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app39');
      logInfo(`${BUNDLE}GridIconName_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0099
     * @tc.name      DragAndExchange_GridIconName_0099
     * @tc.desc      gridIconName(index=38) returns "drag_and_exchange_ic_public_app38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0099 begin`);
      const actual: string = gridIconName(38);
      logInfo(`gridIconName(index=38): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app38');
      logInfo(`${BUNDLE}GridIconName_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0100
     * @tc.name      DragAndExchange_GridIconName_0100
     * @tc.desc      gridIconName(index=132) returns "drag_and_exchange_ic_public_app132"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0100 begin`);
      const actual: string = gridIconName(132);
      logInfo(`gridIconName(index=132): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app132');
      logInfo(`${BUNDLE}GridIconName_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0101
     * @tc.name      DragAndExchange_GridIconName_0101
     * @tc.desc      gridIconName(index=-90) returns "drag_and_exchange_ic_public_app-90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0101 begin`);
      const actual: string = gridIconName(-90);
      logInfo(`gridIconName(index=-90): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-90');
      logInfo(`${BUNDLE}GridIconName_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0102
     * @tc.name      DragAndExchange_GridIconName_0102
     * @tc.desc      gridIconName(index=28) returns "drag_and_exchange_ic_public_app28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0102 begin`);
      const actual: string = gridIconName(28);
      logInfo(`gridIconName(index=28): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app28');
      logInfo(`${BUNDLE}GridIconName_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0103
     * @tc.name      DragAndExchange_GridIconName_0103
     * @tc.desc      gridIconName(index=7) returns "drag_and_exchange_ic_public_app7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0103 begin`);
      const actual: string = gridIconName(7);
      logInfo(`gridIconName(index=7): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app7');
      logInfo(`${BUNDLE}GridIconName_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0104
     * @tc.name      DragAndExchange_GridIconName_0104
     * @tc.desc      gridIconName(index=107) returns "drag_and_exchange_ic_public_app107"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0104 begin`);
      const actual: string = gridIconName(107);
      logInfo(`gridIconName(index=107): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app107');
      logInfo(`${BUNDLE}GridIconName_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0105
     * @tc.name      DragAndExchange_GridIconName_0105
     * @tc.desc      gridIconName(index=15.72) returns "drag_and_exchange_ic_public_app15.72"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0105 begin`);
      const actual: string = gridIconName(15.72);
      logInfo(`gridIconName(index=15.72): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app15.72');
      logInfo(`${BUNDLE}GridIconName_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0106
     * @tc.name      DragAndExchange_GridIconName_0106
     * @tc.desc      gridIconName(index=159) returns "drag_and_exchange_ic_public_app159"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0106 begin`);
      const actual: string = gridIconName(159);
      logInfo(`gridIconName(index=159): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app159');
      logInfo(`${BUNDLE}GridIconName_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0107
     * @tc.name      DragAndExchange_GridIconName_0107
     * @tc.desc      gridIconName(index=-25) returns "drag_and_exchange_ic_public_app-25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0107 begin`);
      const actual: string = gridIconName(-25);
      logInfo(`gridIconName(index=-25): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-25');
      logInfo(`${BUNDLE}GridIconName_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0108
     * @tc.name      DragAndExchange_GridIconName_0108
     * @tc.desc      gridIconName(index=-59) returns "drag_and_exchange_ic_public_app-59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0108 begin`);
      const actual: string = gridIconName(-59);
      logInfo(`gridIconName(index=-59): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-59');
      logInfo(`${BUNDLE}GridIconName_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0109
     * @tc.name      DragAndExchange_GridIconName_0109
     * @tc.desc      gridIconName(index=147) returns "drag_and_exchange_ic_public_app147"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0109 begin`);
      const actual: string = gridIconName(147);
      logInfo(`gridIconName(index=147): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app147');
      logInfo(`${BUNDLE}GridIconName_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0110
     * @tc.name      DragAndExchange_GridIconName_0110
     * @tc.desc      gridIconName(index=136) returns "drag_and_exchange_ic_public_app136"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0110 begin`);
      const actual: string = gridIconName(136);
      logInfo(`gridIconName(index=136): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app136');
      logInfo(`${BUNDLE}GridIconName_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0111
     * @tc.name      DragAndExchange_GridIconName_0111
     * @tc.desc      gridIconName(index=99.31) returns "drag_and_exchange_ic_public_app99.31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0111 begin`);
      const actual: string = gridIconName(99.31);
      logInfo(`gridIconName(index=99.31): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app99.31');
      logInfo(`${BUNDLE}GridIconName_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0112
     * @tc.name      DragAndExchange_GridIconName_0112
     * @tc.desc      gridIconName(index=112) returns "drag_and_exchange_ic_public_app112"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0112 begin`);
      const actual: string = gridIconName(112);
      logInfo(`gridIconName(index=112): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app112');
      logInfo(`${BUNDLE}GridIconName_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0113
     * @tc.name      DragAndExchange_GridIconName_0113
     * @tc.desc      gridIconName(index=-71) returns "drag_and_exchange_ic_public_app-71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridIconName_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridIconName_0113 begin`);
      const actual: string = gridIconName(-71);
      logInfo(`gridIconName(index=-71): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app-71');
      logInfo(`${BUNDLE}GridIconName_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0114
     * @tc.name      DragAndExchange_GridIconName_0114
     * @tc.desc      gridIconName(index=58.61) returns "drag_and_exchange_ic_public_app58.61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0114 begin`);
      const actual: string = gridIconName(58.61);
      logInfo(`gridIconName(index=58.61): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app58.61');
      logInfo(`${BUNDLE}GridIconName_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0115
     * @tc.name      DragAndExchange_GridIconName_0115
     * @tc.desc      gridIconName(index=53) returns "drag_and_exchange_ic_public_app53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0115 begin`);
      const actual: string = gridIconName(53);
      logInfo(`gridIconName(index=53): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app53');
      logInfo(`${BUNDLE}GridIconName_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0116
     * @tc.name      DragAndExchange_GridIconName_0116
     * @tc.desc      gridIconName(index=118) returns "drag_and_exchange_ic_public_app118"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0116 begin`);
      const actual: string = gridIconName(118);
      logInfo(`gridIconName(index=118): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app118');
      logInfo(`${BUNDLE}GridIconName_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0117
     * @tc.name      DragAndExchange_GridIconName_0117
     * @tc.desc      gridIconName(index=95.45) returns "drag_and_exchange_ic_public_app95.45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0117 begin`);
      const actual: string = gridIconName(95.45);
      logInfo(`gridIconName(index=95.45): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app95.45');
      logInfo(`${BUNDLE}GridIconName_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0118
     * @tc.name      DragAndExchange_GridIconName_0118
     * @tc.desc      gridIconName(index=15.22) returns "drag_and_exchange_ic_public_app15.22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0118 begin`);
      const actual: string = gridIconName(15.22);
      logInfo(`gridIconName(index=15.22): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app15.22');
      logInfo(`${BUNDLE}GridIconName_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0119
     * @tc.name      DragAndExchange_GridIconName_0119
     * @tc.desc      gridIconName(index=163) returns "drag_and_exchange_ic_public_app163"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0119 begin`);
      const actual: string = gridIconName(163);
      logInfo(`gridIconName(index=163): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app163');
      logInfo(`${BUNDLE}GridIconName_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_ICON_NAME_0120
     * @tc.name      DragAndExchange_GridIconName_0120
     * @tc.desc      gridIconName(index=71) returns "drag_and_exchange_ic_public_app71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridIconName_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridIconName_0120 begin`);
      const actual: string = gridIconName(71);
      logInfo(`gridIconName(index=71): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_app71');
      logInfo(`${BUNDLE}GridIconName_0120 end`);
    });
  });
}
