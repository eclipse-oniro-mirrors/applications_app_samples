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

import { describe } from '@ohos/hypium';
import { AsyncCleanup, runWithCleanup } from '../support/CaseLifecycle';
import { CaseScope, runCase } from '../support/CaseScope';
import { caseName, expect, it } from '../support/TestCase';

class CapturedFailure {
  public failed: boolean = false;
  public value: Error | undefined = undefined;
}

async function capture(body: AsyncCleanup): Promise<CapturedFailure> {
  const result: CapturedFailure = new CapturedFailure();
  try { await body(); } catch (error) {
    result.failed = true;
    result.value = error as Error;
  }
  return result;
}

export default function caseLifecycleTests(): void {
  describe('CaseLifecycle', (): void => {
    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_0100
     * @tc.name testCaseLifecycle0001
     * @tc.desc Successful body completes every cleanup in the declared order.
     */
    it(caseName('CaseLifecycle', '0001'), 0, async (): Promise<void> => {
      const phases: string[] = [];
      await runWithCleanup(caseName('CaseLifecycle', '0001'), (): void => { phases.push('body'); },
        [(): void => { phases.push('release'); }, (): void => { phases.push('reset'); }]);
      expect(phases.join(','), caseName('CaseLifecycle', '0001'), 'CaseLifecycle.test.ets:A0001').assertEqual('body,release,reset');
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_0200
     * @tc.name testCaseLifecycle0002
     * @tc.desc A body error is rethrown unchanged after successful cleanup.
     */
    it(caseName('CaseLifecycle', '0002'), 0, async (): Promise<void> => {
      const primary: Error = new Error('controlled body failure');
      let cleaned: boolean = false;
      const result = await capture(async (): Promise<void> => {
        await runWithCleanup(caseName('CaseLifecycle', '0002'), (): void => { throw primary; },
          [(): void => { cleaned = true; }]);
      });
      expect(cleaned, caseName('CaseLifecycle', '0002'), 'CaseLifecycle.test.ets:A0002').assertTrue();
      expect(result.failed, caseName('CaseLifecycle', '0002'), 'CaseLifecycle.test.ets:A0003').assertTrue();
      expect(result.value === primary, caseName('CaseLifecycle', '0002'), 'CaseLifecycle.test.ets:A0004').assertTrue();
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_0300
     * @tc.name testCaseLifecycle0003
     * @tc.desc Cleanup-only failure propagates and cannot skip a later cleanup.
     */
    it(caseName('CaseLifecycle', '0003'), 0, async (): Promise<void> => {
      const secondary: Error = new Error('controlled cleanup failure');
      let reset: boolean = false;
      const result = await capture(async (): Promise<void> => {
        await runWithCleanup(caseName('CaseLifecycle', '0003'), (): void => {},
          [(): void => { throw secondary; }, (): void => { reset = true; }]);
      });
      expect(reset, caseName('CaseLifecycle', '0003'), 'CaseLifecycle.test.ets:A0005').assertTrue();
      expect(result.failed, caseName('CaseLifecycle', '0003'), 'CaseLifecycle.test.ets:A0006').assertTrue();
      expect(result.value === secondary, caseName('CaseLifecycle', '0003'), 'CaseLifecycle.test.ets:A0007').assertTrue();
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_0400
     * @tc.name testCaseLifecycle0004
     * @tc.desc Dual failure preserves the original assertion rather than replacing it with cleanup.
     */
    it(caseName('CaseLifecycle', '0004'), 0, async (): Promise<void> => {
      const primary: Error = new Error('controlled body failure');
      const secondary: Error = new Error('controlled cleanup failure');
      let finalCleanup: boolean = false;
      const result = await capture(async (): Promise<void> => {
        await runWithCleanup(caseName('CaseLifecycle', '0004'), (): void => { throw primary; },
          [(): void => { throw secondary; }, (): void => { finalCleanup = true; }]);
      });
      expect(finalCleanup, caseName('CaseLifecycle', '0004'), 'CaseLifecycle.test.ets:A0008').assertTrue();
      expect(result.value === primary, caseName('CaseLifecycle', '0004'), 'CaseLifecycle.test.ets:A0009').assertTrue();
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_0500
     * @tc.name testCaseLifecycle0005
     * @tc.desc An asynchronous cleanup rejection is awaited before remaining cleanup and rethrow.
     */
    it(caseName('CaseLifecycle', '0005'), 0, async (): Promise<void> => {
      const secondary: Error = new Error('async cleanup failure');
      const phases: number[] = [];
      const result = await capture(async (): Promise<void> => {
        await runWithCleanup(caseName('CaseLifecycle', '0005'), (): void => {},
          [async (): Promise<void> => { await Promise.resolve(); phases.push(1); throw secondary; },
            (): void => { phases.push(2); }]);
      });
      expect(phases.join(','), caseName('CaseLifecycle', '0005'), 'CaseLifecycle.test.ets:A0010').assertEqual('1,2');
      expect(result.value === secondary, caseName('CaseLifecycle', '0005'), 'CaseLifecycle.test.ets:A0011').assertTrue();
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_0600
     * @tc.name testCaseLifecycle0006
     * @tc.desc Throwing undefined is a real body failure, not the no-error sentinel.
     */
    it(caseName('CaseLifecycle', '0006'), 0, async (): Promise<void> => {
      const result = await capture(async (): Promise<void> => {
        await runWithCleanup(caseName('CaseLifecycle', '0006'), async (): Promise<void> => {
          await Promise.reject<void>(undefined);
        },
          [(): void => { throw new Error('cleanup must not replace undefined'); }]);
      });
      expect(result.failed, caseName('CaseLifecycle', '0006'), 'CaseLifecycle.test.ets:A0012').assertTrue();
      expect(result.value, caseName('CaseLifecycle', '0006'), 'CaseLifecycle.test.ets:A0013').assertUndefined();
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_0700
     * @tc.name testCaseLifecycle0007
     * @tc.desc Throwing null from cleanup is also propagated rather than swallowed.
     */
    it(caseName('CaseLifecycle', '0007'), 0, async (): Promise<void> => {
      const result = await capture(async (): Promise<void> => {
        await runWithCleanup(caseName('CaseLifecycle', '0007'), (): void => {},
          [async (): Promise<void> => { await Promise.reject<void>(null); }]);
      });
      expect(result.failed, caseName('CaseLifecycle', '0007'), 'CaseLifecycle.test.ets:A0014').assertTrue();
      expect(result.value === null, caseName('CaseLifecycle', '0007'), 'CaseLifecycle.test.ets:A0015').assertTrue();
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_0800
     * @tc.name testCaseLifecycle0008
     * @tc.desc Scope cleanup remains reverse-ordered and idempotent after completion.
     */
    it(caseName('CaseLifecycle', '0008'), 0, (): void => {
      const scope: CaseScope = new CaseScope();
      const actions: number[] = [];
      scope.cleanup((): void => { actions.push(1); });
      scope.cleanup((): void => { actions.push(2); });
      scope.finish();
      scope.finish();
      scope.cleanup((): void => { actions.push(3); });
      expect(actions.join(','), caseName('CaseLifecycle', '0008'), 'CaseLifecycle.test.ets:A0016').assertEqual('2,1,3');
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_0900
     * @tc.name testCaseLifecycle0009
     * @tc.desc runCase preserves body error while all reverse-ordered failing cleanup actions run.
     */
    it(caseName('CaseLifecycle', '0009'), 0, async (): Promise<void> => {
      const primary: Error = new Error('primary scope failure');
      const actions: number[] = [];
      const result = await capture(async (): Promise<void> => {
        await runCase(caseName('CaseLifecycle', '0009'), async (scope: CaseScope): Promise<void> => {
          scope.cleanup((): void => { actions.push(1); });
          scope.cleanup((): void => { actions.push(2); throw new Error('secondary scope failure'); });
          throw primary;
        });
      });
      expect(actions.join(','), caseName('CaseLifecycle', '0009'), 'CaseLifecycle.test.ets:A0017').assertEqual('2,1');
      expect(result.value === primary, caseName('CaseLifecycle', '0009'), 'CaseLifecycle.test.ets:A0018').assertTrue();
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_1000
     * @tc.name testCaseLifecycle0010
     * @tc.desc Watchdog timeout releases subscriptions and propagates a failure after cleanup.
     */
    it(caseName('CaseLifecycle', '0010'), 0, async (): Promise<void> => {
      let released: boolean = false;
      const result = await capture(async (): Promise<void> => {
        await runCase(caseName('CaseLifecycle', '0010'), async (scope: CaseScope): Promise<void> => {
          await scope.until((): boolean => false, (_changed: () => void): (() => void) => {
            return (): void => { released = true; };
          });
        }, 1);
      });
      expect(result.failed, caseName('CaseLifecycle', '0010'), 'CaseLifecycle.test.ets:A0019').assertTrue();
      expect(released, caseName('CaseLifecycle', '0010'), 'CaseLifecycle.test.ets:A0020').assertTrue();
      expect(result.value?.message, caseName('CaseLifecycle', '0010'), 'CaseLifecycle.test.ets:A0021').assertEqual('case-watchdog-timeout');
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_1100
     * @tc.name testCaseLifecycle0011
     * @tc.desc Scope cleanup-only failure propagates unchanged after all remaining actions.
     */
    it(caseName('CaseLifecycle', '0011'), 0, async (): Promise<void> => {
      const secondary: Error = new Error('cleanup-only scope failure');
      let released: boolean = false;
      const result = await capture(async (): Promise<void> => {
        await runCase(caseName('CaseLifecycle', '0011'), async (scope: CaseScope): Promise<void> => {
          scope.cleanup((): void => { released = true; });
          scope.cleanup((): void => { throw secondary; });
        });
      });
      expect(result.failed, caseName('CaseLifecycle', '0011'), 'CaseLifecycle.test.ets:A0022').assertTrue();
      expect(result.value === secondary, caseName('CaseLifecycle', '0011'), 'CaseLifecycle.test.ets:A0023').assertTrue();
      expect(released, caseName('CaseLifecycle', '0011'), 'CaseLifecycle.test.ets:A0024').assertTrue();
    });

    /** @tc.number SUB_SHORTCUT_CASELIFECYCLE_1200
     * @tc.name testCaseLifecycle0012
     * @tc.desc Timeout remains primary when subscription cleanup also fails.
     */
    it(caseName('CaseLifecycle', '0012'), 0, async (): Promise<void> => {
      let finalCleanup: boolean = false;
      const result = await capture(async (): Promise<void> => {
        await runCase(caseName('CaseLifecycle', '0012'), async (scope: CaseScope): Promise<void> => {
          scope.cleanup((): void => { finalCleanup = true; });
          scope.cleanup((): void => { throw new Error('cleanup after timeout'); });
          await scope.until((): boolean => false, (_changed: () => void): (() => void) => {
            return (): void => {};
          });
        }, 1);
      });
      expect(result.failed, caseName('CaseLifecycle', '0012'), 'CaseLifecycle.test.ets:A0025').assertTrue();
      expect(finalCleanup, caseName('CaseLifecycle', '0012'), 'CaseLifecycle.test.ets:A0026').assertTrue();
      expect(result.value?.message, caseName('CaseLifecycle', '0012'), 'CaseLifecycle.test.ets:A0027').assertEqual('case-watchdog-timeout');
    });
  });
}
