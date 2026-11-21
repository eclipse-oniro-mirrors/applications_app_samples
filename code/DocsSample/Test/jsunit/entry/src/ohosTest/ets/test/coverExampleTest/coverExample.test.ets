/*
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, expect, it, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

// Two-level suites: suite setup is visible to descendants, local beforeEach is not inherited.
export default function coverExampleTest(): void {
  describe('coverExampleTest', (): void => {
    const scopes: Map<string, string> = new Map<string, string>();
    const setupTrace: string[] = [];
    let trace: string[] = [];
    beforeAll((): void => {
      scopes.set('outer', 'ready');
      setupTrace.push('outer setup');
    });
    beforeEach(async (): Promise<void> => {
      await paceTurn();
      trace = setupTrace.slice();
      trace.push('outer before');
    });

    /**
     * @tc.number testJsunitNestedOuter0001
     * @tc.name testJsunitNestedOuter0001
     * @tc.desc Observe outer setup and local hook scope before the child suite starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitNestedOuter0001', TestType.FUNCTION, (): void => {
      hilog.info(0x0000, 'NestedExample', 'outer hook trace=%{public}s', JSON.stringify(trace));
      expect(trace).assertDeepEquals(['outer setup', 'outer before']);
      hilog.info(0x0000, 'NestedExample', 'outer setup state=%{public}s', scopes.get('outer'));
      expect(scopes.get('outer')).assertEqual('ready');
      hilog.info(0x0000, 'NestedExample', 'child scope visible=%{public}s', String(scopes.has('inner')));
      expect(scopes.has('inner')).assertFalse();
    });

    describe('coverExampleTest_inner', (): void => {
      beforeAll((): void => {
        scopes.set('inner', 'ready');
        setupTrace.push('inner setup');
      });
      beforeEach(async (): Promise<void> => {
        await paceTurn();
        trace = setupTrace.slice();
        trace.push('inner before');
      });

      /**
       * @tc.number testJsunitNestedInner0002
       * @tc.name testJsunitNestedInner0002
       * @tc.desc Observe inherited setup and child-local hook without executing outer beforeEach
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('testJsunitNestedInner0002', TestType.FUNCTION, (): void => {
        hilog.info(0x0000, 'NestedExample', 'child hook trace=%{public}s', JSON.stringify(trace));
        expect(trace).assertDeepEquals(['outer setup', 'inner setup', 'inner before']);
        hilog.info(0x0000, 'NestedExample', 'inherited outer scope=%{public}s', scopes.get('outer'));
        expect(scopes.get('outer')).assertEqual('ready');
        hilog.info(0x0000, 'NestedExample', 'child setup state=%{public}s', scopes.get('inner'));
        expect(scopes.get('inner')).assertEqual('ready');
      });
    });
  });
}
