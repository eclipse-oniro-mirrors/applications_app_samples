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
import { listIconName } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for listIconName (24 cases). */
export default function listIconName2Test(): void {
  describe('ListIconName2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0097
     * @tc.name      DragAndExchange_ListIconName_0097
     * @tc.desc      listIconName(index=72) returns "drag_and_exchange_ic_public_game73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0097 begin`);
      const actual: string = listIconName(72);
      logInfo(`listIconName(index=72): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game73');
      logInfo(`${BUNDLE}ListIconName_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0098
     * @tc.name      DragAndExchange_ListIconName_0098
     * @tc.desc      listIconName(index=24) returns "drag_and_exchange_ic_public_game25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0098 begin`);
      const actual: string = listIconName(24);
      logInfo(`listIconName(index=24): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game25');
      logInfo(`${BUNDLE}ListIconName_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0099
     * @tc.name      DragAndExchange_ListIconName_0099
     * @tc.desc      listIconName(index=43.33) returns "drag_and_exchange_ic_public_game44.33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0099 begin`);
      const actual: string = listIconName(43.33);
      logInfo(`listIconName(index=43.33): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game44.33');
      logInfo(`${BUNDLE}ListIconName_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0100
     * @tc.name      DragAndExchange_ListIconName_0100
     * @tc.desc      listIconName(index=53.1) returns "drag_and_exchange_ic_public_game54.1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0100 begin`);
      const actual: string = listIconName(53.1);
      logInfo(`listIconName(index=53.1): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game54.1');
      logInfo(`${BUNDLE}ListIconName_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0101
     * @tc.name      DragAndExchange_ListIconName_0101
     * @tc.desc      listIconName(index=38.84) returns "drag_and_exchange_ic_public_game39.84"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0101 begin`);
      const actual: string = listIconName(38.84);
      logInfo(`listIconName(index=38.84): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game39.84');
      logInfo(`${BUNDLE}ListIconName_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0102
     * @tc.name      DragAndExchange_ListIconName_0102
     * @tc.desc      listIconName(index=-42) returns "drag_and_exchange_ic_public_game-41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0102 begin`);
      const actual: string = listIconName(-42);
      logInfo(`listIconName(index=-42): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-41');
      logInfo(`${BUNDLE}ListIconName_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0103
     * @tc.name      DragAndExchange_ListIconName_0103
     * @tc.desc      listIconName(index=-23) returns "drag_and_exchange_ic_public_game-22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0103 begin`);
      const actual: string = listIconName(-23);
      logInfo(`listIconName(index=-23): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-22');
      logInfo(`${BUNDLE}ListIconName_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0104
     * @tc.name      DragAndExchange_ListIconName_0104
     * @tc.desc      listIconName(index=-78) returns "drag_and_exchange_ic_public_game-77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0104 begin`);
      const actual: string = listIconName(-78);
      logInfo(`listIconName(index=-78): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-77');
      logInfo(`${BUNDLE}ListIconName_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0105
     * @tc.name      DragAndExchange_ListIconName_0105
     * @tc.desc      listIconName(index=-41) returns "drag_and_exchange_ic_public_game-40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0105 begin`);
      const actual: string = listIconName(-41);
      logInfo(`listIconName(index=-41): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-40');
      logInfo(`${BUNDLE}ListIconName_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0106
     * @tc.name      DragAndExchange_ListIconName_0106
     * @tc.desc      listIconName(index=41.26) returns "drag_and_exchange_ic_public_game42.26"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0106 begin`);
      const actual: string = listIconName(41.26);
      logInfo(`listIconName(index=41.26): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game42.26');
      logInfo(`${BUNDLE}ListIconName_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0107
     * @tc.name      DragAndExchange_ListIconName_0107
     * @tc.desc      listIconName(index=58) returns "drag_and_exchange_ic_public_game59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0107 begin`);
      const actual: string = listIconName(58);
      logInfo(`listIconName(index=58): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game59');
      logInfo(`${BUNDLE}ListIconName_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0108
     * @tc.name      DragAndExchange_ListIconName_0108
     * @tc.desc      listIconName(index=107) returns "drag_and_exchange_ic_public_game108"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0108 begin`);
      const actual: string = listIconName(107);
      logInfo(`listIconName(index=107): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game108');
      logInfo(`${BUNDLE}ListIconName_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0109
     * @tc.name      DragAndExchange_ListIconName_0109
     * @tc.desc      listIconName(index=-76) returns "drag_and_exchange_ic_public_game-75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0109 begin`);
      const actual: string = listIconName(-76);
      logInfo(`listIconName(index=-76): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-75');
      logInfo(`${BUNDLE}ListIconName_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0110
     * @tc.name      DragAndExchange_ListIconName_0110
     * @tc.desc      listIconName(index=-7) returns "drag_and_exchange_ic_public_game-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0110 begin`);
      const actual: string = listIconName(-7);
      logInfo(`listIconName(index=-7): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-6');
      logInfo(`${BUNDLE}ListIconName_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0111
     * @tc.name      DragAndExchange_ListIconName_0111
     * @tc.desc      listIconName(index=192) returns "drag_and_exchange_ic_public_game193"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0111 begin`);
      const actual: string = listIconName(192);
      logInfo(`listIconName(index=192): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game193');
      logInfo(`${BUNDLE}ListIconName_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0112
     * @tc.name      DragAndExchange_ListIconName_0112
     * @tc.desc      listIconName(index=-39) returns "drag_and_exchange_ic_public_game-38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0112 begin`);
      const actual: string = listIconName(-39);
      logInfo(`listIconName(index=-39): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-38');
      logInfo(`${BUNDLE}ListIconName_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0113
     * @tc.name      DragAndExchange_ListIconName_0113
     * @tc.desc      listIconName(index=76) returns "drag_and_exchange_ic_public_game77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0113 begin`);
      const actual: string = listIconName(76);
      logInfo(`listIconName(index=76): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game77');
      logInfo(`${BUNDLE}ListIconName_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0114
     * @tc.name      DragAndExchange_ListIconName_0114
     * @tc.desc      listIconName(index=17) returns "drag_and_exchange_ic_public_game18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0114 begin`);
      const actual: string = listIconName(17);
      logInfo(`listIconName(index=17): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game18');
      logInfo(`${BUNDLE}ListIconName_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0115
     * @tc.name      DragAndExchange_ListIconName_0115
     * @tc.desc      listIconName(index=196) returns "drag_and_exchange_ic_public_game197"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0115 begin`);
      const actual: string = listIconName(196);
      logInfo(`listIconName(index=196): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game197');
      logInfo(`${BUNDLE}ListIconName_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0116
     * @tc.name      DragAndExchange_ListIconName_0116
     * @tc.desc      listIconName(index=-13) returns "drag_and_exchange_ic_public_game-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0116 begin`);
      const actual: string = listIconName(-13);
      logInfo(`listIconName(index=-13): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-12');
      logInfo(`${BUNDLE}ListIconName_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0117
     * @tc.name      DragAndExchange_ListIconName_0117
     * @tc.desc      listIconName(index=183) returns "drag_and_exchange_ic_public_game184"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0117 begin`);
      const actual: string = listIconName(183);
      logInfo(`listIconName(index=183): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game184');
      logInfo(`${BUNDLE}ListIconName_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0118
     * @tc.name      DragAndExchange_ListIconName_0118
     * @tc.desc      listIconName(index=4.21) returns "drag_and_exchange_ic_public_game5.21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0118 begin`);
      const actual: string = listIconName(4.21);
      logInfo(`listIconName(index=4.21): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game5.21');
      logInfo(`${BUNDLE}ListIconName_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0119
     * @tc.name      DragAndExchange_ListIconName_0119
     * @tc.desc      listIconName(index=-67) returns "drag_and_exchange_ic_public_game-66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListIconName_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListIconName_0119 begin`);
      const actual: string = listIconName(-67);
      logInfo(`listIconName(index=-67): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game-66');
      logInfo(`${BUNDLE}ListIconName_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ICON_NAME_0120
     * @tc.name      DragAndExchange_ListIconName_0120
     * @tc.desc      listIconName(index=138) returns "drag_and_exchange_ic_public_game139"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListIconName_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListIconName_0120 begin`);
      const actual: string = listIconName(138);
      logInfo(`listIconName(index=138): actual=${actual}`);
      expect(actual).assertEqual('drag_and_exchange_ic_public_game139');
      logInfo(`${BUNDLE}ListIconName_0120 end`);
    });
  });
}
