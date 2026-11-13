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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
import {
  ExecutorClock, SafeExecutor
} from '../../../main/ets/core/SafeExecutor';

const NOW: number = 1700000000000;
const DAY: number = 86400000;

/** 手动时钟：记录延迟，按需触发。 */
class FakeClock implements ExecutorClock {
  private action: (() => void) | null = null;
  private delay: number = -1;
  private cleared: number = 0;

  setTimeout(action: () => void, delay: number): number {
    this.action = action;
    this.delay = delay;
    return 7;
  }

  clearTimeout(_id: number): void {
    this.action = null;
    this.cleared++;
  }

  has(): boolean {
    return this.action !== null;
  }

  lastDelay(): number {
    return this.delay;
  }

  clearCount(): number {
    return this.cleared;
  }
}

export default function templateCoreCasesTest(): void {

  describe('SafeExecutorCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_SAFEEXECUTORCASES_0100
     * @tc.name      testSafeExecutorCases0001
     * @tc.desc      Verify acquire serialises runs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSafeExecutorCases0001', 0, (): void => {
      const clock: FakeClock = new FakeClock();
      const executor: SafeExecutor = new SafeExecutor(clock, (): void => {
      });
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0001 TemplateCoreCases.test:70 assertFalse actual', executor.busy())).assertFalse();
      const token: number = executor.acquire();
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0001 TemplateCoreCases.test:72 assertTrue actual', token > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0001 TemplateCoreCases.test:73 assertTrue actual', executor.busy())).assertTrue();
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0001 TemplateCoreCases.test:74 assertEqual actual', executor.acquire())).assertEqual(traceParameter('com.samples.appperformance_SafeExecutorCases_0001 TemplateCoreCases.test:74 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0001 TemplateCoreCases.test:75 assertFalse actual', executor.quarantined())).assertFalse();
      executor.release(token);
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0001 TemplateCoreCases.test:77 assertFalse actual', executor.busy())).assertFalse();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_SAFEEXECUTORCASES_0200
     * @tc.name      testSafeExecutorCases0002
     * @tc.desc      Verify release ignores wrong token
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSafeExecutorCases0002', 0, (): void => {
      const executor: SafeExecutor = new SafeExecutor(new FakeClock(), (): void => {
      });
      const token: number = executor.acquire();
      executor.release(token + 99);
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0002 TemplateCoreCases.test:94 assertTrue actual', executor.busy())).assertTrue();
      executor.release(token);
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0002 TemplateCoreCases.test:96 assertFalse actual', executor.busy())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0002 TemplateCoreCases.test:97 assertTrue actual', token >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_SAFEEXECUTORCASES_0300
     * @tc.name      testSafeExecutorCases0003
     * @tc.desc      Verify cancel marks reason and notifies
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSafeExecutorCases0003', 0, (): void => {
      let notified: number = 0;
      const executor: SafeExecutor = new SafeExecutor(new FakeClock(), (): void => {
        notified++;
      });
      executor.cancel();
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0003 TemplateCoreCases.test:115 assertEqual actual', notified)).assertEqual(traceParameter('com.samples.appperformance_SafeExecutorCases_0003 TemplateCoreCases.test:115 assertEqual expected', 0));
      const token: number = executor.acquire();
      executor.cancel();
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0003 TemplateCoreCases.test:118 assertEqual actual', executor.reason())).assertEqual(traceParameter('com.samples.appperformance_SafeExecutorCases_0003 TemplateCoreCases.test:118 assertEqual expected', 'cancelled'));
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0003 TemplateCoreCases.test:119 assertEqual actual', notified)).assertEqual(traceParameter('com.samples.appperformance_SafeExecutorCases_0003 TemplateCoreCases.test:119 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0003 TemplateCoreCases.test:120 assertTrue actual', executor.busy())).assertTrue();
      executor.release(token);
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0003 TemplateCoreCases.test:122 assertFalse actual', executor.busy())).assertFalse();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_SAFEEXECUTORCASES_0400
     * @tc.name      testSafeExecutorCases0004
     * @tc.desc      Verify acquire clears stopped reason
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSafeExecutorCases0004', 0, (): void => {
      const executor: SafeExecutor = new SafeExecutor(new FakeClock(), (): void => {
      });
      const first: number = executor.acquire();
      executor.cancel();
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0004 TemplateCoreCases.test:139 assertEqual actual', executor.reason())).assertEqual(traceParameter('com.samples.appperformance_SafeExecutorCases_0004 TemplateCoreCases.test:139 assertEqual expected', 'cancelled'));
      executor.release(first);
      const second: number = executor.acquire();
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0004 TemplateCoreCases.test:142 assertTrue actual', second > first)).assertTrue();
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0004 TemplateCoreCases.test:143 assertEqual actual', executor.reason())).assertEqual(traceParameter('com.samples.appperformance_SafeExecutorCases_0004 TemplateCoreCases.test:143 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_SafeExecutorCases_0004 TemplateCoreCases.test:144 assertFalse actual', executor.quarantined())).assertFalse();
    });
  });
}
