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

/** Logic checks for reorder (81 cases). */
export default function reorder3Test(): void {
  describe('Reorder3Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0168
     * @tc.name      ListBeExchange_Reorder_0168
     * @tc.desc      reorder(items=[], index=73, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0168 begin`);
      const actual: string[] = reorder([], 73, 5);
      logInfo(`reorder(items=[], index=73, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0168 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0169
     * @tc.name      ListBeExchange_Reorder_0169
     * @tc.desc      reorder(items=[], index=73, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0169 begin`);
      const actual: string[] = reorder([], 73, 10);
      logInfo(`reorder(items=[], index=73, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0169 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0170
     * @tc.name      ListBeExchange_Reorder_0170
     * @tc.desc      reorder(items=[], index=73, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0170 begin`);
      const actual: string[] = reorder([], 73, 3);
      logInfo(`reorder(items=[], index=73, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0170 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0171
     * @tc.name      ListBeExchange_Reorder_0171
     * @tc.desc      reorder(items=[], index=73, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0171 begin`);
      const actual: string[] = reorder([], 73, 100);
      logInfo(`reorder(items=[], index=73, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0171 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0172
     * @tc.name      ListBeExchange_Reorder_0172
     * @tc.desc      reorder(items=[], index=73, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0172 begin`);
      const actual: string[] = reorder([], 73, 15);
      logInfo(`reorder(items=[], index=73, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0172 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0173
     * @tc.name      ListBeExchange_Reorder_0173
     * @tc.desc      reorder(items=[], index=73, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0173 begin`);
      const actual: string[] = reorder([], 73, 20);
      logInfo(`reorder(items=[], index=73, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0173 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0174
     * @tc.name      ListBeExchange_Reorder_0174
     * @tc.desc      reorder(items=[], index=73, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0174 begin`);
      const actual: string[] = reorder([], 73, 31.78);
      logInfo(`reorder(items=[], index=73, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0174 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0175
     * @tc.name      ListBeExchange_Reorder_0175
     * @tc.desc      reorder(items=[], index=73, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0175 begin`);
      const actual: string[] = reorder([], 73, 2.08);
      logInfo(`reorder(items=[], index=73, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=73, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0175 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0176
     * @tc.name      ListBeExchange_Reorder_0176
     * @tc.desc      reorder(items=[], index=92, newIndex=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0176 begin`);
      const actual: string[] = reorder([], 92, 0);
      logInfo(`reorder(items=[], index=92, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0176 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0177
     * @tc.name      ListBeExchange_Reorder_0177
     * @tc.desc      reorder(items=[], index=92, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0177 begin`);
      const actual: string[] = reorder([], 92, 1);
      logInfo(`reorder(items=[], index=92, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0177 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0178
     * @tc.name      ListBeExchange_Reorder_0178
     * @tc.desc      reorder(items=[], index=92, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0178 begin`);
      const actual: string[] = reorder([], 92, 2);
      logInfo(`reorder(items=[], index=92, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0178 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0179
     * @tc.name      ListBeExchange_Reorder_0179
     * @tc.desc      reorder(items=[], index=92, newIndex=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0179 begin`);
      const actual: string[] = reorder([], 92, -1);
      logInfo(`reorder(items=[], index=92, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0179 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0180
     * @tc.name      ListBeExchange_Reorder_0180
     * @tc.desc      reorder(items=[], index=92, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0180 begin`);
      const actual: string[] = reorder([], 92, 5);
      logInfo(`reorder(items=[], index=92, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0180 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0181
     * @tc.name      ListBeExchange_Reorder_0181
     * @tc.desc      reorder(items=[], index=92, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0181 begin`);
      const actual: string[] = reorder([], 92, 10);
      logInfo(`reorder(items=[], index=92, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0181 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0182
     * @tc.name      ListBeExchange_Reorder_0182
     * @tc.desc      reorder(items=[], index=92, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0182 begin`);
      const actual: string[] = reorder([], 92, 3);
      logInfo(`reorder(items=[], index=92, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0182 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0183
     * @tc.name      ListBeExchange_Reorder_0183
     * @tc.desc      reorder(items=[], index=92, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0183 begin`);
      const actual: string[] = reorder([], 92, 100);
      logInfo(`reorder(items=[], index=92, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0183 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0184
     * @tc.name      ListBeExchange_Reorder_0184
     * @tc.desc      reorder(items=[], index=92, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0184 begin`);
      const actual: string[] = reorder([], 92, 15);
      logInfo(`reorder(items=[], index=92, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0184 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0185
     * @tc.name      ListBeExchange_Reorder_0185
     * @tc.desc      reorder(items=[], index=92, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0185 begin`);
      const actual: string[] = reorder([], 92, 20);
      logInfo(`reorder(items=[], index=92, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0185 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0186
     * @tc.name      ListBeExchange_Reorder_0186
     * @tc.desc      reorder(items=[], index=92, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0186 begin`);
      const actual: string[] = reorder([], 92, 31.78);
      logInfo(`reorder(items=[], index=92, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0186 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0187
     * @tc.name      ListBeExchange_Reorder_0187
     * @tc.desc      reorder(items=[], index=92, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0187 begin`);
      const actual: string[] = reorder([], 92, 2.08);
      logInfo(`reorder(items=[], index=92, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[], index=92, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0187 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0188
     * @tc.name      ListBeExchange_Reorder_0188
     * @tc.desc      reorder(items=[""], index=0, newIndex=1) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0188 begin`);
      const actual: string[] = reorder([''], 0, 1);
      logInfo(`reorder(items=[""], index=0, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0188 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0189
     * @tc.name      ListBeExchange_Reorder_0189
     * @tc.desc      reorder(items=[""], index=0, newIndex=2) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0189 begin`);
      const actual: string[] = reorder([''], 0, 2);
      logInfo(`reorder(items=[""], index=0, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=2): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0189 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0190
     * @tc.name      ListBeExchange_Reorder_0190
     * @tc.desc      reorder(items=[""], index=0, newIndex=-1) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0190 begin`);
      const actual: string[] = reorder([''], 0, -1);
      logInfo(`reorder(items=[""], index=0, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=-1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0190 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0191
     * @tc.name      ListBeExchange_Reorder_0191
     * @tc.desc      reorder(items=[""], index=0, newIndex=5) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0191 begin`);
      const actual: string[] = reorder([''], 0, 5);
      logInfo(`reorder(items=[""], index=0, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=5): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0191 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0192
     * @tc.name      ListBeExchange_Reorder_0192
     * @tc.desc      reorder(items=[""], index=0, newIndex=10) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0192 begin`);
      const actual: string[] = reorder([''], 0, 10);
      logInfo(`reorder(items=[""], index=0, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=10): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0192 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0193
     * @tc.name      ListBeExchange_Reorder_0193
     * @tc.desc      reorder(items=[""], index=0, newIndex=3) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0193 begin`);
      const actual: string[] = reorder([''], 0, 3);
      logInfo(`reorder(items=[""], index=0, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=3): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0193 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0194
     * @tc.name      ListBeExchange_Reorder_0194
     * @tc.desc      reorder(items=[""], index=0, newIndex=100) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0194 begin`);
      const actual: string[] = reorder([''], 0, 100);
      logInfo(`reorder(items=[""], index=0, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=100): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0194 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0195
     * @tc.name      ListBeExchange_Reorder_0195
     * @tc.desc      reorder(items=[""], index=0, newIndex=15) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0195 begin`);
      const actual: string[] = reorder([''], 0, 15);
      logInfo(`reorder(items=[""], index=0, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=15): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0195 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0196
     * @tc.name      ListBeExchange_Reorder_0196
     * @tc.desc      reorder(items=[""], index=0, newIndex=20) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0196 begin`);
      const actual: string[] = reorder([''], 0, 20);
      logInfo(`reorder(items=[""], index=0, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=20): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0196 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0197
     * @tc.name      ListBeExchange_Reorder_0197
     * @tc.desc      reorder(items=[""], index=0, newIndex=31.78) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0197 begin`);
      const actual: string[] = reorder([''], 0, 31.78);
      logInfo(`reorder(items=[""], index=0, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=31.78): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0197 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0198
     * @tc.name      ListBeExchange_Reorder_0198
     * @tc.desc      reorder(items=[""], index=0, newIndex=2.08) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0198 begin`);
      const actual: string[] = reorder([''], 0, 2.08);
      logInfo(`reorder(items=[""], index=0, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=0, newIndex=2.08): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0198 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0199
     * @tc.name      ListBeExchange_Reorder_0199
     * @tc.desc      reorder(items=[""], index=1, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0199 begin`);
      const actual: string[] = reorder([''], 1, 2);
      logInfo(`reorder(items=[""], index=1, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=2): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0199 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0200
     * @tc.name      ListBeExchange_Reorder_0200
     * @tc.desc      reorder(items=[""], index=1, newIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0200 begin`);
      const actual: string[] = reorder([''], 1, -1);
      logInfo(`reorder(items=[""], index=1, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=[""], index=1, newIndex=-1): actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}Reorder_0200 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0201
     * @tc.name      ListBeExchange_Reorder_0201
     * @tc.desc      reorder(items=[""], index=1, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0201 begin`);
      const actual: string[] = reorder([''], 1, 5);
      logInfo(`reorder(items=[""], index=1, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=5): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0201 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0202
     * @tc.name      ListBeExchange_Reorder_0202
     * @tc.desc      reorder(items=[""], index=1, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0202 begin`);
      const actual: string[] = reorder([''], 1, 10);
      logInfo(`reorder(items=[""], index=1, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=10): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0202 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0203
     * @tc.name      ListBeExchange_Reorder_0203
     * @tc.desc      reorder(items=[""], index=1, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0203 begin`);
      const actual: string[] = reorder([''], 1, 3);
      logInfo(`reorder(items=[""], index=1, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=3): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0203 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0204
     * @tc.name      ListBeExchange_Reorder_0204
     * @tc.desc      reorder(items=[""], index=1, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0204 begin`);
      const actual: string[] = reorder([''], 1, 100);
      logInfo(`reorder(items=[""], index=1, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=100): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0204 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0205
     * @tc.name      ListBeExchange_Reorder_0205
     * @tc.desc      reorder(items=[""], index=1, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0205 begin`);
      const actual: string[] = reorder([''], 1, 15);
      logInfo(`reorder(items=[""], index=1, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=15): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0205 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0206
     * @tc.name      ListBeExchange_Reorder_0206
     * @tc.desc      reorder(items=[""], index=1, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0206 begin`);
      const actual: string[] = reorder([''], 1, 20);
      logInfo(`reorder(items=[""], index=1, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=20): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0206 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0207
     * @tc.name      ListBeExchange_Reorder_0207
     * @tc.desc      reorder(items=[""], index=1, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0207 begin`);
      const actual: string[] = reorder([''], 1, 31.78);
      logInfo(`reorder(items=[""], index=1, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=31.78): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0207 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0208
     * @tc.name      ListBeExchange_Reorder_0208
     * @tc.desc      reorder(items=[""], index=1, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0208 begin`);
      const actual: string[] = reorder([''], 1, 2.08);
      logInfo(`reorder(items=[""], index=1, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=1, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=1, newIndex=2.08): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0208 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0209
     * @tc.name      ListBeExchange_Reorder_0209
     * @tc.desc      reorder(items=[""], index=2, newIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0209 begin`);
      const actual: string[] = reorder([''], 2, 0);
      logInfo(`reorder(items=[""], index=2, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=[""], index=2, newIndex=0): actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}Reorder_0209 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0210
     * @tc.name      ListBeExchange_Reorder_0210
     * @tc.desc      reorder(items=[""], index=2, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0210 begin`);
      const actual: string[] = reorder([''], 2, 1);
      logInfo(`reorder(items=[""], index=2, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=1): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0210 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0211
     * @tc.name      ListBeExchange_Reorder_0211
     * @tc.desc      reorder(items=[""], index=2, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0211 begin`);
      const actual: string[] = reorder([''], 2, 2);
      logInfo(`reorder(items=[""], index=2, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=2): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0211 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0212
     * @tc.name      ListBeExchange_Reorder_0212
     * @tc.desc      reorder(items=[""], index=2, newIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0212 begin`);
      const actual: string[] = reorder([''], 2, -1);
      logInfo(`reorder(items=[""], index=2, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=[""], index=2, newIndex=-1): actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}Reorder_0212 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0213
     * @tc.name      ListBeExchange_Reorder_0213
     * @tc.desc      reorder(items=[""], index=2, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0213 begin`);
      const actual: string[] = reorder([''], 2, 5);
      logInfo(`reorder(items=[""], index=2, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=5): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0213 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0214
     * @tc.name      ListBeExchange_Reorder_0214
     * @tc.desc      reorder(items=[""], index=2, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0214 begin`);
      const actual: string[] = reorder([''], 2, 10);
      logInfo(`reorder(items=[""], index=2, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=10): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0214 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0215
     * @tc.name      ListBeExchange_Reorder_0215
     * @tc.desc      reorder(items=[""], index=2, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0215 begin`);
      const actual: string[] = reorder([''], 2, 3);
      logInfo(`reorder(items=[""], index=2, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=3): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0215 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0216
     * @tc.name      ListBeExchange_Reorder_0216
     * @tc.desc      reorder(items=[""], index=2, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0216 begin`);
      const actual: string[] = reorder([''], 2, 100);
      logInfo(`reorder(items=[""], index=2, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=100): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0216 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0217
     * @tc.name      ListBeExchange_Reorder_0217
     * @tc.desc      reorder(items=[""], index=2, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0217 begin`);
      const actual: string[] = reorder([''], 2, 15);
      logInfo(`reorder(items=[""], index=2, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=15): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0217 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0218
     * @tc.name      ListBeExchange_Reorder_0218
     * @tc.desc      reorder(items=[""], index=2, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0218 begin`);
      const actual: string[] = reorder([''], 2, 20);
      logInfo(`reorder(items=[""], index=2, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=20): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0218 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0219
     * @tc.name      ListBeExchange_Reorder_0219
     * @tc.desc      reorder(items=[""], index=2, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0219 begin`);
      const actual: string[] = reorder([''], 2, 31.78);
      logInfo(`reorder(items=[""], index=2, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=31.78): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0219 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0220
     * @tc.name      ListBeExchange_Reorder_0220
     * @tc.desc      reorder(items=[""], index=2, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0220 begin`);
      const actual: string[] = reorder([''], 2, 2.08);
      logInfo(`reorder(items=[""], index=2, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=2, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=2, newIndex=2.08): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0220 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0221
     * @tc.name      ListBeExchange_Reorder_0221
     * @tc.desc      reorder(items=[""], index=-1, newIndex=0) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0221 begin`);
      const actual: string[] = reorder([''], -1, 0);
      logInfo(`reorder(items=[""], index=-1, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=0): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0221 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0222
     * @tc.name      ListBeExchange_Reorder_0222
     * @tc.desc      reorder(items=[""], index=-1, newIndex=1) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0222 begin`);
      const actual: string[] = reorder([''], -1, 1);
      logInfo(`reorder(items=[""], index=-1, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0222 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0223
     * @tc.name      ListBeExchange_Reorder_0223
     * @tc.desc      reorder(items=[""], index=-1, newIndex=2) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0223 begin`);
      const actual: string[] = reorder([''], -1, 2);
      logInfo(`reorder(items=[""], index=-1, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=2): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0223 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0224
     * @tc.name      ListBeExchange_Reorder_0224
     * @tc.desc      reorder(items=[""], index=-1, newIndex=-1) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0224 begin`);
      const actual: string[] = reorder([''], -1, -1);
      logInfo(`reorder(items=[""], index=-1, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=-1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0224 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0225
     * @tc.name      ListBeExchange_Reorder_0225
     * @tc.desc      reorder(items=[""], index=-1, newIndex=5) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0225 begin`);
      const actual: string[] = reorder([''], -1, 5);
      logInfo(`reorder(items=[""], index=-1, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=5): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0225 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0226
     * @tc.name      ListBeExchange_Reorder_0226
     * @tc.desc      reorder(items=[""], index=-1, newIndex=10) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0226 begin`);
      const actual: string[] = reorder([''], -1, 10);
      logInfo(`reorder(items=[""], index=-1, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=10): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0226 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0227
     * @tc.name      ListBeExchange_Reorder_0227
     * @tc.desc      reorder(items=[""], index=-1, newIndex=3) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0227 begin`);
      const actual: string[] = reorder([''], -1, 3);
      logInfo(`reorder(items=[""], index=-1, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=3): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0227 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0228
     * @tc.name      ListBeExchange_Reorder_0228
     * @tc.desc      reorder(items=[""], index=-1, newIndex=100) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0228 begin`);
      const actual: string[] = reorder([''], -1, 100);
      logInfo(`reorder(items=[""], index=-1, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=100): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0228 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0229
     * @tc.name      ListBeExchange_Reorder_0229
     * @tc.desc      reorder(items=[""], index=-1, newIndex=15) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0229 begin`);
      const actual: string[] = reorder([''], -1, 15);
      logInfo(`reorder(items=[""], index=-1, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=15): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0229 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0230
     * @tc.name      ListBeExchange_Reorder_0230
     * @tc.desc      reorder(items=[""], index=-1, newIndex=20) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0230 begin`);
      const actual: string[] = reorder([''], -1, 20);
      logInfo(`reorder(items=[""], index=-1, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=20): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0230 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0231
     * @tc.name      ListBeExchange_Reorder_0231
     * @tc.desc      reorder(items=[""], index=-1, newIndex=31.78) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0231 begin`);
      const actual: string[] = reorder([''], -1, 31.78);
      logInfo(`reorder(items=[""], index=-1, newIndex=31...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=31...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0231 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0232
     * @tc.name      ListBeExchange_Reorder_0232
     * @tc.desc      reorder(items=[""], index=-1, newIndex=2.08) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0232 begin`);
      const actual: string[] = reorder([''], -1, 2.08);
      logInfo(`reorder(items=[""], index=-1, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`reorder(items=[""], index=-1, newIndex=2.08): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}Reorder_0232 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0233
     * @tc.name      ListBeExchange_Reorder_0233
     * @tc.desc      reorder(items=[""], index=5, newIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0233 begin`);
      const actual: string[] = reorder([''], 5, 0);
      logInfo(`reorder(items=[""], index=5, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=[""], index=5, newIndex=0): actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}Reorder_0233 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0234
     * @tc.name      ListBeExchange_Reorder_0234
     * @tc.desc      reorder(items=[""], index=5, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0234 begin`);
      const actual: string[] = reorder([''], 5, 1);
      logInfo(`reorder(items=[""], index=5, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=1): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0234 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0235
     * @tc.name      ListBeExchange_Reorder_0235
     * @tc.desc      reorder(items=[""], index=5, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0235 begin`);
      const actual: string[] = reorder([''], 5, 2);
      logInfo(`reorder(items=[""], index=5, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=2): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0235 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0236
     * @tc.name      ListBeExchange_Reorder_0236
     * @tc.desc      reorder(items=[""], index=5, newIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0236 begin`);
      const actual: string[] = reorder([''], 5, -1);
      logInfo(`reorder(items=[""], index=5, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=[""], index=5, newIndex=-1): actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}Reorder_0236 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0237
     * @tc.name      ListBeExchange_Reorder_0237
     * @tc.desc      reorder(items=[""], index=5, newIndex=5) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0237 begin`);
      const actual: string[] = reorder([''], 5, 5);
      logInfo(`reorder(items=[""], index=5, newIndex=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=5): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=5): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0237 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0238
     * @tc.name      ListBeExchange_Reorder_0238
     * @tc.desc      reorder(items=[""], index=5, newIndex=10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0238 begin`);
      const actual: string[] = reorder([''], 5, 10);
      logInfo(`reorder(items=[""], index=5, newIndex=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=10): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=10): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0238 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0239
     * @tc.name      ListBeExchange_Reorder_0239
     * @tc.desc      reorder(items=[""], index=5, newIndex=3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0239 begin`);
      const actual: string[] = reorder([''], 5, 3);
      logInfo(`reorder(items=[""], index=5, newIndex=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=3): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=3): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0239 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0240
     * @tc.name      ListBeExchange_Reorder_0240
     * @tc.desc      reorder(items=[""], index=5, newIndex=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0240 begin`);
      const actual: string[] = reorder([''], 5, 100);
      logInfo(`reorder(items=[""], index=5, newIndex=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=100): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=100): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0240 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0241
     * @tc.name      ListBeExchange_Reorder_0241
     * @tc.desc      reorder(items=[""], index=5, newIndex=15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0241 begin`);
      const actual: string[] = reorder([''], 5, 15);
      logInfo(`reorder(items=[""], index=5, newIndex=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=15): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=15): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0241 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0242
     * @tc.name      ListBeExchange_Reorder_0242
     * @tc.desc      reorder(items=[""], index=5, newIndex=20) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0242 begin`);
      const actual: string[] = reorder([''], 5, 20);
      logInfo(`reorder(items=[""], index=5, newIndex=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=20): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=20): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0242 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0243
     * @tc.name      ListBeExchange_Reorder_0243
     * @tc.desc      reorder(items=[""], index=5, newIndex=31.78) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0243 begin`);
      const actual: string[] = reorder([''], 5, 31.78);
      logInfo(`reorder(items=[""], index=5, newIndex=31.78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=31.78): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=31.78): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0243 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0244
     * @tc.name      ListBeExchange_Reorder_0244
     * @tc.desc      reorder(items=[""], index=5, newIndex=2.08) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0244 begin`);
      const actual: string[] = reorder([''], 5, 2.08);
      logInfo(`reorder(items=[""], index=5, newIndex=2.08): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=5, newIndex=2.08): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=5, newIndex=2.08): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0244 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0245
     * @tc.name      ListBeExchange_Reorder_0245
     * @tc.desc      reorder(items=[""], index=10, newIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0245 begin`);
      const actual: string[] = reorder([''], 10, 0);
      logInfo(`reorder(items=[""], index=10, newIndex=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=10, newIndex=0): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=[""], index=10, newIndex=0): actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}Reorder_0245 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0246
     * @tc.name      ListBeExchange_Reorder_0246
     * @tc.desc      reorder(items=[""], index=10, newIndex=1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_Reorder_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Reorder_0246 begin`);
      const actual: string[] = reorder([''], 10, 1);
      logInfo(`reorder(items=[""], index=10, newIndex=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=10, newIndex=1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=10, newIndex=1): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0246 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0247
     * @tc.name      ListBeExchange_Reorder_0247
     * @tc.desc      reorder(items=[""], index=10, newIndex=2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0247 begin`);
      const actual: string[] = reorder([''], 10, 2);
      logInfo(`reorder(items=[""], index=10, newIndex=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=10, newIndex=2): actual[0]=${actual[0]}`);
      expect(actual[0]).assertEqual('');
      logInfo(`reorder(items=[""], index=10, newIndex=2): actual[1]=${actual[1]}`);
      expect(actual[1]).assertUndefined();
      logInfo(`${BUNDLE}Reorder_0247 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REORDER_0248
     * @tc.name      ListBeExchange_Reorder_0248
     * @tc.desc      reorder(items=[""], index=10, newIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_Reorder_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}Reorder_0248 begin`);
      const actual: string[] = reorder([''], 10, -1);
      logInfo(`reorder(items=[""], index=10, newIndex=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`reorder(items=[""], index=10, newIndex=-1): actual[0]=${actual[0]}`);
      expect(actual[0]).assertUndefined();
      logInfo(`reorder(items=[""], index=10, newIndex=-1): actual[1]=${actual[1]}`);
      expect(actual[1]).assertEqual('');
      logInfo(`${BUNDLE}Reorder_0248 end`);
    });
  });
}
