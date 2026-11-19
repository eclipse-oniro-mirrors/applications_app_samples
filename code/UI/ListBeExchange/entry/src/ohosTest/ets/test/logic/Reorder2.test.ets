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
import { reorder } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for reorder (85 cases). */
export default function reorder2Test(): void {
  describe('Reorder2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0083
     * @tc.name      ListBeExchange_Reorder_0083
     * @tc.desc      reorder(items=[], index=-1, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0083 begin`);
      const actual: string[] = reorder([], -1, -1);
      logInfo(`reorder(items=[], index=-1, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0084
     * @tc.name      ListBeExchange_Reorder_0084
     * @tc.desc      reorder(items=[], index=-1, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0084 begin`);
      const actual: string[] = reorder([], -1, 5);
      logInfo(`reorder(items=[], index=-1, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0085
     * @tc.name      ListBeExchange_Reorder_0085
     * @tc.desc      reorder(items=[], index=-1, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0085 begin`);
      const actual: string[] = reorder([], -1, 10);
      logInfo(`reorder(items=[], index=-1, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0086
     * @tc.name      ListBeExchange_Reorder_0086
     * @tc.desc      reorder(items=[], index=-1, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0086 begin`);
      const actual: string[] = reorder([], -1, 3);
      logInfo(`reorder(items=[], index=-1, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0087
     * @tc.name      ListBeExchange_Reorder_0087
     * @tc.desc      reorder(items=[], index=-1, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0087 begin`);
      const actual: string[] = reorder([], -1, 100);
      logInfo(`reorder(items=[], index=-1, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0088
     * @tc.name      ListBeExchange_Reorder_0088
     * @tc.desc      reorder(items=[], index=-1, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0088 begin`);
      const actual: string[] = reorder([], -1, 15);
      logInfo(`reorder(items=[], index=-1, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0089
     * @tc.name      ListBeExchange_Reorder_0089
     * @tc.desc      reorder(items=[], index=-1, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0089 begin`);
      const actual: string[] = reorder([], -1, 20);
      logInfo(`reorder(items=[], index=-1, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0090
     * @tc.name      ListBeExchange_Reorder_0090
     * @tc.desc      reorder(items=[], index=-1, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0090 begin`);
      const actual: string[] = reorder([], -1, 31.78);
      logInfo(`reorder(items=[], index=-1, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0090 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0091
     * @tc.name      ListBeExchange_Reorder_0091
     * @tc.desc      reorder(items=[], index=-1, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0091 begin`);
      const actual: string[] = reorder([], -1, 2.08);
      logInfo(`reorder(items=[], index=-1, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=-1, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0091 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0092
     * @tc.name      ListBeExchange_Reorder_0092
     * @tc.desc      reorder(items=[], index=5, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0092 begin`);
      const actual: string[] = reorder([], 5, 0);
      logInfo(`reorder(items=[], index=5, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0092 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0093
     * @tc.name      ListBeExchange_Reorder_0093
     * @tc.desc      reorder(items=[], index=5, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0093 begin`);
      const actual: string[] = reorder([], 5, 1);
      logInfo(`reorder(items=[], index=5, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0093 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0094
     * @tc.name      ListBeExchange_Reorder_0094
     * @tc.desc      reorder(items=[], index=5, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0094 begin`);
      const actual: string[] = reorder([], 5, 2);
      logInfo(`reorder(items=[], index=5, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0094 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0095
     * @tc.name      ListBeExchange_Reorder_0095
     * @tc.desc      reorder(items=[], index=5, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0095 begin`);
      const actual: string[] = reorder([], 5, -1);
      logInfo(`reorder(items=[], index=5, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0095 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0096
     * @tc.name      ListBeExchange_Reorder_0096
     * @tc.desc      reorder(items=[], index=5, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0096 begin`);
      const actual: string[] = reorder([], 5, 5);
      logInfo(`reorder(items=[], index=5, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0096 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0097
     * @tc.name      ListBeExchange_Reorder_0097
     * @tc.desc      reorder(items=[], index=5, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0097 begin`);
      const actual: string[] = reorder([], 5, 10);
      logInfo(`reorder(items=[], index=5, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0097 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0098
     * @tc.name      ListBeExchange_Reorder_0098
     * @tc.desc      reorder(items=[], index=5, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0098 begin`);
      const actual: string[] = reorder([], 5, 3);
      logInfo(`reorder(items=[], index=5, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0098 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0099
     * @tc.name      ListBeExchange_Reorder_0099
     * @tc.desc      reorder(items=[], index=5, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0099 begin`);
      const actual: string[] = reorder([], 5, 100);
      logInfo(`reorder(items=[], index=5, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0099 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0100
     * @tc.name      ListBeExchange_Reorder_0100
     * @tc.desc      reorder(items=[], index=5, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0100 begin`);
      const actual: string[] = reorder([], 5, 15);
      logInfo(`reorder(items=[], index=5, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0100 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0101
     * @tc.name      ListBeExchange_Reorder_0101
     * @tc.desc      reorder(items=[], index=5, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0101 begin`);
      const actual: string[] = reorder([], 5, 20);
      logInfo(`reorder(items=[], index=5, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0101 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0102
     * @tc.name      ListBeExchange_Reorder_0102
     * @tc.desc      reorder(items=[], index=5, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0102 begin`);
      const actual: string[] = reorder([], 5, 31.78);
      logInfo(`reorder(items=[], index=5, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0102 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0103
     * @tc.name      ListBeExchange_Reorder_0103
     * @tc.desc      reorder(items=[], index=5, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0103 begin`);
      const actual: string[] = reorder([], 5, 2.08);
      logInfo(`reorder(items=[], index=5, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=5, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0103 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0104
     * @tc.name      ListBeExchange_Reorder_0104
     * @tc.desc      reorder(items=[], index=10, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0104 begin`);
      const actual: string[] = reorder([], 10, 0);
      logInfo(`reorder(items=[], index=10, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0104 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0105
     * @tc.name      ListBeExchange_Reorder_0105
     * @tc.desc      reorder(items=[], index=10, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0105 begin`);
      const actual: string[] = reorder([], 10, 1);
      logInfo(`reorder(items=[], index=10, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0105 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0106
     * @tc.name      ListBeExchange_Reorder_0106
     * @tc.desc      reorder(items=[], index=10, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0106 begin`);
      const actual: string[] = reorder([], 10, 2);
      logInfo(`reorder(items=[], index=10, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0106 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0107
     * @tc.name      ListBeExchange_Reorder_0107
     * @tc.desc      reorder(items=[], index=10, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0107 begin`);
      const actual: string[] = reorder([], 10, -1);
      logInfo(`reorder(items=[], index=10, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0107 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0108
     * @tc.name      ListBeExchange_Reorder_0108
     * @tc.desc      reorder(items=[], index=10, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0108 begin`);
      const actual: string[] = reorder([], 10, 5);
      logInfo(`reorder(items=[], index=10, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0108 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0109
     * @tc.name      ListBeExchange_Reorder_0109
     * @tc.desc      reorder(items=[], index=10, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0109 begin`);
      const actual: string[] = reorder([], 10, 10);
      logInfo(`reorder(items=[], index=10, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0109 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0110
     * @tc.name      ListBeExchange_Reorder_0110
     * @tc.desc      reorder(items=[], index=10, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0110 begin`);
      const actual: string[] = reorder([], 10, 3);
      logInfo(`reorder(items=[], index=10, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0110 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0111
     * @tc.name      ListBeExchange_Reorder_0111
     * @tc.desc      reorder(items=[], index=10, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0111 begin`);
      const actual: string[] = reorder([], 10, 100);
      logInfo(`reorder(items=[], index=10, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0111 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0112
     * @tc.name      ListBeExchange_Reorder_0112
     * @tc.desc      reorder(items=[], index=10, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0112 begin`);
      const actual: string[] = reorder([], 10, 15);
      logInfo(`reorder(items=[], index=10, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0112 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0113
     * @tc.name      ListBeExchange_Reorder_0113
     * @tc.desc      reorder(items=[], index=10, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0113 begin`);
      const actual: string[] = reorder([], 10, 20);
      logInfo(`reorder(items=[], index=10, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0113 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0114
     * @tc.name      ListBeExchange_Reorder_0114
     * @tc.desc      reorder(items=[], index=10, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0114 begin`);
      const actual: string[] = reorder([], 10, 31.78);
      logInfo(`reorder(items=[], index=10, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0114 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0115
     * @tc.name      ListBeExchange_Reorder_0115
     * @tc.desc      reorder(items=[], index=10, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0115 begin`);
      const actual: string[] = reorder([], 10, 2.08);
      logInfo(`reorder(items=[], index=10, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=10, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0115 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0116
     * @tc.name      ListBeExchange_Reorder_0116
     * @tc.desc      reorder(items=[], index=3, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0116 begin`);
      const actual: string[] = reorder([], 3, 0);
      logInfo(`reorder(items=[], index=3, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0116 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0117
     * @tc.name      ListBeExchange_Reorder_0117
     * @tc.desc      reorder(items=[], index=3, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0117 begin`);
      const actual: string[] = reorder([], 3, 1);
      logInfo(`reorder(items=[], index=3, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0117 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0118
     * @tc.name      ListBeExchange_Reorder_0118
     * @tc.desc      reorder(items=[], index=3, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0118 begin`);
      const actual: string[] = reorder([], 3, 2);
      logInfo(`reorder(items=[], index=3, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0118 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0119
     * @tc.name      ListBeExchange_Reorder_0119
     * @tc.desc      reorder(items=[], index=3, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0119 begin`);
      const actual: string[] = reorder([], 3, -1);
      logInfo(`reorder(items=[], index=3, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0119 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0120
     * @tc.name      ListBeExchange_Reorder_0120
     * @tc.desc      reorder(items=[], index=3, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0120 begin`);
      const actual: string[] = reorder([], 3, 5);
      logInfo(`reorder(items=[], index=3, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0120 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0121
     * @tc.name      ListBeExchange_Reorder_0121
     * @tc.desc      reorder(items=[], index=3, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0121 begin`);
      const actual: string[] = reorder([], 3, 10);
      logInfo(`reorder(items=[], index=3, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0121 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0122
     * @tc.name      ListBeExchange_Reorder_0122
     * @tc.desc      reorder(items=[], index=3, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0122 begin`);
      const actual: string[] = reorder([], 3, 3);
      logInfo(`reorder(items=[], index=3, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0122 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0123
     * @tc.name      ListBeExchange_Reorder_0123
     * @tc.desc      reorder(items=[], index=3, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0123 begin`);
      const actual: string[] = reorder([], 3, 100);
      logInfo(`reorder(items=[], index=3, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0123 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0124
     * @tc.name      ListBeExchange_Reorder_0124
     * @tc.desc      reorder(items=[], index=3, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0124 begin`);
      const actual: string[] = reorder([], 3, 15);
      logInfo(`reorder(items=[], index=3, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0124 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0125
     * @tc.name      ListBeExchange_Reorder_0125
     * @tc.desc      reorder(items=[], index=3, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0125 begin`);
      const actual: string[] = reorder([], 3, 20);
      logInfo(`reorder(items=[], index=3, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0125 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0126
     * @tc.name      ListBeExchange_Reorder_0126
     * @tc.desc      reorder(items=[], index=3, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0126 begin`);
      const actual: string[] = reorder([], 3, 31.78);
      logInfo(`reorder(items=[], index=3, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0126 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0127
     * @tc.name      ListBeExchange_Reorder_0127
     * @tc.desc      reorder(items=[], index=3, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0127 begin`);
      const actual: string[] = reorder([], 3, 2.08);
      logInfo(`reorder(items=[], index=3, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=3, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0127 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0128
     * @tc.name      ListBeExchange_Reorder_0128
     * @tc.desc      reorder(items=[], index=100, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0128 begin`);
      const actual: string[] = reorder([], 100, 0);
      logInfo(`reorder(items=[], index=100, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0128 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0129
     * @tc.name      ListBeExchange_Reorder_0129
     * @tc.desc      reorder(items=[], index=100, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0129 begin`);
      const actual: string[] = reorder([], 100, 1);
      logInfo(`reorder(items=[], index=100, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0129 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0130
     * @tc.name      ListBeExchange_Reorder_0130
     * @tc.desc      reorder(items=[], index=100, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0130 begin`);
      const actual: string[] = reorder([], 100, 2);
      logInfo(`reorder(items=[], index=100, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0130 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0131
     * @tc.name      ListBeExchange_Reorder_0131
     * @tc.desc      reorder(items=[], index=100, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0131 begin`);
      const actual: string[] = reorder([], 100, -1);
      logInfo(`reorder(items=[], index=100, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0131 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0132
     * @tc.name      ListBeExchange_Reorder_0132
     * @tc.desc      reorder(items=[], index=100, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0132 begin`);
      const actual: string[] = reorder([], 100, 5);
      logInfo(`reorder(items=[], index=100, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0132 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0133
     * @tc.name      ListBeExchange_Reorder_0133
     * @tc.desc      reorder(items=[], index=100, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0133 begin`);
      const actual: string[] = reorder([], 100, 10);
      logInfo(`reorder(items=[], index=100, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0133 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0134
     * @tc.name      ListBeExchange_Reorder_0134
     * @tc.desc      reorder(items=[], index=100, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0134 begin`);
      const actual: string[] = reorder([], 100, 3);
      logInfo(`reorder(items=[], index=100, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0134 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0135
     * @tc.name      ListBeExchange_Reorder_0135
     * @tc.desc      reorder(items=[], index=100, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0135 begin`);
      const actual: string[] = reorder([], 100, 100);
      logInfo(`reorder(items=[], index=100, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0135 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0136
     * @tc.name      ListBeExchange_Reorder_0136
     * @tc.desc      reorder(items=[], index=100, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0136 begin`);
      const actual: string[] = reorder([], 100, 15);
      logInfo(`reorder(items=[], index=100, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0136 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0137
     * @tc.name      ListBeExchange_Reorder_0137
     * @tc.desc      reorder(items=[], index=100, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0137 begin`);
      const actual: string[] = reorder([], 100, 20);
      logInfo(`reorder(items=[], index=100, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0137 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0138
     * @tc.name      ListBeExchange_Reorder_0138
     * @tc.desc      reorder(items=[], index=100, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0138 begin`);
      const actual: string[] = reorder([], 100, 31.78);
      logInfo(`reorder(items=[], index=100, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0138 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0139
     * @tc.name      ListBeExchange_Reorder_0139
     * @tc.desc      reorder(items=[], index=100, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0139 begin`);
      const actual: string[] = reorder([], 100, 2.08);
      logInfo(`reorder(items=[], index=100, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=100, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0139 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0140
     * @tc.name      ListBeExchange_Reorder_0140
     * @tc.desc      reorder(items=[], index=15, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0140 begin`);
      const actual: string[] = reorder([], 15, 0);
      logInfo(`reorder(items=[], index=15, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0140 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0141
     * @tc.name      ListBeExchange_Reorder_0141
     * @tc.desc      reorder(items=[], index=15, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0141 begin`);
      const actual: string[] = reorder([], 15, 1);
      logInfo(`reorder(items=[], index=15, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0141 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0142
     * @tc.name      ListBeExchange_Reorder_0142
     * @tc.desc      reorder(items=[], index=15, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0142 begin`);
      const actual: string[] = reorder([], 15, 2);
      logInfo(`reorder(items=[], index=15, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0142 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0143
     * @tc.name      ListBeExchange_Reorder_0143
     * @tc.desc      reorder(items=[], index=15, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0143 begin`);
      const actual: string[] = reorder([], 15, -1);
      logInfo(`reorder(items=[], index=15, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0143 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0144
     * @tc.name      ListBeExchange_Reorder_0144
     * @tc.desc      reorder(items=[], index=15, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0144 begin`);
      const actual: string[] = reorder([], 15, 5);
      logInfo(`reorder(items=[], index=15, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0144 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0145
     * @tc.name      ListBeExchange_Reorder_0145
     * @tc.desc      reorder(items=[], index=15, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0145 begin`);
      const actual: string[] = reorder([], 15, 10);
      logInfo(`reorder(items=[], index=15, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0145 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0146
     * @tc.name      ListBeExchange_Reorder_0146
     * @tc.desc      reorder(items=[], index=15, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0146 begin`);
      const actual: string[] = reorder([], 15, 3);
      logInfo(`reorder(items=[], index=15, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0146 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0147
     * @tc.name      ListBeExchange_Reorder_0147
     * @tc.desc      reorder(items=[], index=15, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0147 begin`);
      const actual: string[] = reorder([], 15, 100);
      logInfo(`reorder(items=[], index=15, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0147 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0148
     * @tc.name      ListBeExchange_Reorder_0148
     * @tc.desc      reorder(items=[], index=15, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0148 begin`);
      const actual: string[] = reorder([], 15, 15);
      logInfo(`reorder(items=[], index=15, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0148 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0149
     * @tc.name      ListBeExchange_Reorder_0149
     * @tc.desc      reorder(items=[], index=15, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0149 begin`);
      const actual: string[] = reorder([], 15, 20);
      logInfo(`reorder(items=[], index=15, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0149 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0150
     * @tc.name      ListBeExchange_Reorder_0150
     * @tc.desc      reorder(items=[], index=15, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0150 begin`);
      const actual: string[] = reorder([], 15, 31.78);
      logInfo(`reorder(items=[], index=15, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0150 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0151
     * @tc.name      ListBeExchange_Reorder_0151
     * @tc.desc      reorder(items=[], index=15, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0151 begin`);
      const actual: string[] = reorder([], 15, 2.08);
      logInfo(`reorder(items=[], index=15, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=15, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0151 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0152
     * @tc.name      ListBeExchange_Reorder_0152
     * @tc.desc      reorder(items=[], index=20, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0152 begin`);
      const actual: string[] = reorder([], 20, 0);
      logInfo(`reorder(items=[], index=20, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0152 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0153
     * @tc.name      ListBeExchange_Reorder_0153
     * @tc.desc      reorder(items=[], index=20, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0153 begin`);
      const actual: string[] = reorder([], 20, 1);
      logInfo(`reorder(items=[], index=20, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0153 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0154
     * @tc.name      ListBeExchange_Reorder_0154
     * @tc.desc      reorder(items=[], index=20, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0154 begin`);
      const actual: string[] = reorder([], 20, 2);
      logInfo(`reorder(items=[], index=20, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0154 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0155
     * @tc.name      ListBeExchange_Reorder_0155
     * @tc.desc      reorder(items=[], index=20, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0155 begin`);
      const actual: string[] = reorder([], 20, -1);
      logInfo(`reorder(items=[], index=20, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0155 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0156
     * @tc.name      ListBeExchange_Reorder_0156
     * @tc.desc      reorder(items=[], index=20, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0156 begin`);
      const actual: string[] = reorder([], 20, 5);
      logInfo(`reorder(items=[], index=20, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0156 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0157
     * @tc.name      ListBeExchange_Reorder_0157
     * @tc.desc      reorder(items=[], index=20, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0157 begin`);
      const actual: string[] = reorder([], 20, 10);
      logInfo(`reorder(items=[], index=20, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0157 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0158
     * @tc.name      ListBeExchange_Reorder_0158
     * @tc.desc      reorder(items=[], index=20, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0158 begin`);
      const actual: string[] = reorder([], 20, 3);
      logInfo(`reorder(items=[], index=20, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0158 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0159
     * @tc.name      ListBeExchange_Reorder_0159
     * @tc.desc      reorder(items=[], index=20, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0159 begin`);
      const actual: string[] = reorder([], 20, 100);
      logInfo(`reorder(items=[], index=20, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0159 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0160
     * @tc.name      ListBeExchange_Reorder_0160
     * @tc.desc      reorder(items=[], index=20, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0160 begin`);
      const actual: string[] = reorder([], 20, 15);
      logInfo(`reorder(items=[], index=20, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0160 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0161
     * @tc.name      ListBeExchange_Reorder_0161
     * @tc.desc      reorder(items=[], index=20, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0161 begin`);
      const actual: string[] = reorder([], 20, 20);
      logInfo(`reorder(items=[], index=20, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0161 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0162
     * @tc.name      ListBeExchange_Reorder_0162
     * @tc.desc      reorder(items=[], index=20, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0162 begin`);
      const actual: string[] = reorder([], 20, 31.78);
      logInfo(`reorder(items=[], index=20, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0162 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0163
     * @tc.name      ListBeExchange_Reorder_0163
     * @tc.desc      reorder(items=[], index=20, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0163 begin`);
      const actual: string[] = reorder([], 20, 2.08);
      logInfo(`reorder(items=[], index=20, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=20, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0163 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0164
     * @tc.name      ListBeExchange_Reorder_0164
     * @tc.desc      reorder(items=[], index=73, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0164 begin`);
      const actual: string[] = reorder([], 73, 0);
      logInfo(`reorder(items=[], index=73, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0164 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0165
     * @tc.name      ListBeExchange_Reorder_0165
     * @tc.desc      reorder(items=[], index=73, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0165 begin`);
      const actual: string[] = reorder([], 73, 1);
      logInfo(`reorder(items=[], index=73, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0165 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0166
     * @tc.name      ListBeExchange_Reorder_0166
     * @tc.desc      reorder(items=[], index=73, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0166 begin`);
      const actual: string[] = reorder([], 73, 2);
      logInfo(`reorder(items=[], index=73, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0166 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0167
     * @tc.name      ListBeExchange_Reorder_0167
     * @tc.desc      reorder(items=[], index=73, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0167 begin`);
      const actual: string[] = reorder([], 73, -1);
      logInfo(`reorder(items=[], index=73, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0167 end`);
    });
  });
}
