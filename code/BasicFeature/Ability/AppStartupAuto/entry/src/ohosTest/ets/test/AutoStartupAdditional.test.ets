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

import { afterEach, beforeEach, describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import { BusinessError } from '@kit.BasicServicesKit';
import { AutoStartupApi } from '../../../main/ets/autostart/AutoStartupRuntime';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';
import { QueryPhase, QuerySnapshot, RefreshSource, SupportState } from '../../../main/ets/autostart/AutoStartupTypes';
import {
  apiResultLabel, formatQueryTime, sourceLabel, statusLabel, supportLabel
} from '../../../main/ets/components/QueryPresentation';
import { AutoStartupFixture, flushMicrotasks, ManualQueryClock, TestBusinessError } from '../support/TestSupport';

// A rejected native promise need not carry a BusinessError payload.
class EmptyRejectionApi implements AutoStartupApi {
  public probeCalls: number = 0;
  public queryCalls: number = 0;

  isAutoStartupSupported(): boolean {
    this.probeCalls++;
    return true;
  }

  getAutoStartupStatusForSelf(): Promise<boolean> {
    this.queryCalls++;
    return Promise.reject<boolean>(null);
  }
}

export default function autoStartupAdditionalTest(): void {
  configureTestText();
  describe('AutoStartupAdditionalBranches', () => {
    let fixture: AutoStartupFixture = new AutoStartupFixture();

    beforeEach(() => {
      configureTestText();
      fixture = new AutoStartupFixture();
    });

    afterEach(async (): Promise<void> => {
      fixture.service.dispose();
      const remainingTimers: number = fixture.clock.pendingCount();
      fixture.clock.clearAll();
      fixture.api.finishPending();
      await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|AutoStartupAdditional.test.ets|assert0001|assertEqual|actual', remainingTimers)).assertEqual(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|AutoStartupAdditional.test.ets|assert0001|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|AutoStartupAdditional.test.ets|assert0002|assertEqual|actual', fixture.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|AutoStartupAdditional.test.ets|assert0002|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0100
     * @tc.name      testAutoStartupAdditionalBranches0001
     * @tc.desc      Verify disposed service ignores refresh and late completion until foreground
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0001', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      let notifications: number = 0;
      f.service.subscribe((): void => {
        notifications++;
      });
      f.service.refresh(RefreshSource.INITIAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0003|assertEqual|actual', notifications)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0003|assertEqual|expected', 1));
      f.service.dispose();
      f.service.dispose();
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.MANUAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0004|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0004|assertEqual|expected', QueryPhase.IDLE));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0005|assertTrue|actual|expected=true', f.service.snapshot().pending)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0006|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0006|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0007|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0007|assertEqual|expected', 1));
      f.clock.advance(6000);
      f.api.resolveNext(true);
      await flushMicrotasks();

      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0008|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0008|assertEqual|expected', QueryPhase.IDLE));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0009|assertFalse|actual|expected=false', f.service.snapshot().pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0010|assertNull|actual|expected=null', f.service.snapshot().value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0011|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0011|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0012|assertEqual|actual', notifications)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0012|assertEqual|expected', 1));
      f.service.onForeground();
      f.service.onForeground();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0013|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0013|assertEqual|expected', 2));
      f.api.resolveNext(false);
      await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0014|assertFalse|actual|expected=false', f.service.snapshot().value)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0015|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0015|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0016|assertEqual|actual', f.service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0016|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0017|assertEqual|actual', notifications)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0001|AutoStartupAdditional.test.ets|assert0017|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0200
     * @tc.name      testAutoStartupAdditionalBranches0002
     * @tc.desc      Verify resubscribe before late success preserves native single flight
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0002', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.SETTINGS);
      f.service.dispose();
      let notifications: number = 0;
      const unsubscribe = f.service.subscribe((): void => {
        notifications++;
      });
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.MANUAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0018|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0018|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0019|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0019|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0020|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0020|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0021|assertEqual|actual', notifications)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0021|assertEqual|expected', 0));
      f.api.resolveNext(true);
      await flushMicrotasks();

      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0022|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0022|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0023|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0023|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0024|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0024|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0025|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0025|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0026|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0026|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0027|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0027|assertEqual|expected', QueryPhase.QUERYING));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0028|assertNull|actual|expected=null', f.service.snapshot().value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0029|assertNull|actual|expected=null', f.service.snapshot().lastValue)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0030|assertEqual|actual', notifications)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0030|assertEqual|expected', 1));
      f.api.resolveNext(false);
      await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0031|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0031|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0032|assertEqual|actual', f.service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0032|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0033|assertEqual|actual', f.service.records()[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0033|assertEqual|expected', RefreshSource.INITIAL));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0034|assertFalse|actual|expected=false', f.service.snapshot().value)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0035|assertEqual|actual', notifications)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0002|AutoStartupAdditional.test.ets|assert0035|assertEqual|expected', 2));
      unsubscribe();
      unsubscribe();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0300
     * @tc.name      testAutoStartupAdditionalBranches0003
     * @tc.desc      Verify foreground before late failure restarts only after native release
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0003', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.dispose();
      f.service.onForeground();
      f.service.onForeground();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0036|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0036|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0037|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0037|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0038|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0038|assertEqual|expected', QueryPhase.IDLE));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0039|assertTrue|actual|expected=true', f.service.snapshot().pending)).assertTrue();
      f.clock.advance(7000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0040|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0040|assertEqual|expected', 0));
      f.api.rejectNext(new TestBusinessError(801, 'obsolete native rejection'));
      await flushMicrotasks();

      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0041|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0041|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0042|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0042|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0043|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0043|assertEqual|expected', QueryPhase.QUERYING));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0044|assertEqual|actual', f.service.snapshot().errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0044|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0045|assertEqual|actual', f.service.snapshot().errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0045|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0046|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0046|assertEqual|expected', 0));
      f.api.resolveNext(true);
      await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0047|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0047|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0048|assertEqual|actual', f.service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0048|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0049|assertEqual|actual', f.service.records()[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0049|assertEqual|expected', RefreshSource.INITIAL));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0003|AutoStartupAdditional.test.ets|assert0050|assertTrue|actual|expected=true', f.service.snapshot().value)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0400
     * @tc.name      testAutoStartupAdditionalBranches0004
     * @tc.desc      Verify background completion does not schedule deferred refresh
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0004', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.SETTINGS);
      f.service.onBackground();
      f.api.rejectNext(new TestBusinessError(16000050, 'completed in background'));
      await flushMicrotasks();

      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0051|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0051|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0052|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0052|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0053|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0053|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0054|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0054|assertEqual|expected', QueryPhase.FAILED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0055|assertFalse|actual|expected=false', f.service.snapshot().pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0056|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0056|assertEqual|expected', 1));
      f.clock.advance(10000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0057|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0057|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0058|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0058|assertEqual|expected', 1));
      f.service.onForeground();
      f.service.onForeground();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0059|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0059|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0060|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0060|assertEqual|expected', 1));
      f.api.resolveNext(true);
      await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0061|assertTrue|actual|expected=true', f.service.snapshot().value)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0062|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0062|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0063|assertEqual|actual', f.service.records()[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0004|AutoStartupAdditional.test.ets|assert0063|assertEqual|expected', RefreshSource.FOREGROUND));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0500
     * @tc.name      testAutoStartupAdditionalBranches0005
     * @tc.desc      Verify timeout discards late failure and retains last good sample
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0005', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(19);
      f.api.resolveNext(false);
      await flushMicrotasks();
      const successful = f.service.snapshot();
      f.service.refresh(RefreshSource.MANUAL);
      f.clock.advance(5000);
      const timedOut = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0064|assertEqual|actual', timedOut.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0064|assertEqual|expected', QueryPhase.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0065|assertFalse|actual|expected=false', timedOut.lastValue)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0066|assertEqual|actual', timedOut.lastSampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0066|assertEqual|expected', successful.sampleTime));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0067|assertTrue|actual|expected=true', timedOut.pending)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0068|assertEqual|actual', timedOut.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0068|assertEqual|expected', 'Timed out waiting for the system response'));
      f.clock.advance(3000);
      f.api.rejectNext(new TestBusinessError(801, 'arrived after timeout'));
      await flushMicrotasks();

      const late = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0069|assertEqual|actual', late.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0069|assertEqual|expected', QueryPhase.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0070|assertFalse|actual|expected=false', late.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0071|assertNull|actual|expected=null', late.value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0072|assertFalse|actual|expected=false', late.lastValue)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0073|assertEqual|actual', late.lastSampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0073|assertEqual|expected', successful.sampleTime));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0074|assertEqual|actual', late.sampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0074|assertEqual|expected', timedOut.sampleTime));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0075|assertEqual|actual', late.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0075|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0076|assertEqual|actual', late.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0076|assertEqual|expected', timedOut.errorMessage));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0077|assertEqual|actual', late.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0077|assertEqual|expected', timedOut.statusResult));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0078|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0078|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0079|assertEqual|actual', f.service.records()[0].errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0079|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0080|assertEqual|actual', f.service.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0080|assertEqual|expected', 5000));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0081|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0081|assertEqual|expected', 0));
      f.service.refresh(RefreshSource.MANUAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0082|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0082|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0083|assertEqual|actual', f.service.snapshot().errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0083|assertEqual|expected', ''));
      f.api.resolveNext(true);
      await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0084|assertTrue|actual|expected=true', f.service.snapshot().value)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0085|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0005|AutoStartupAdditional.test.ets|assert0085|assertEqual|expected', 3));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0600
     * @tc.name      testAutoStartupAdditionalBranches0006
     * @tc.desc      Verify timed out request holds deferred settings until late rejection
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0006', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.SETTINGS);
      f.clock.advance(5000);
      f.service.refresh(RefreshSource.FOREGROUND);
      f.service.refresh(RefreshSource.MANUAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0086|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0086|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0087|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0087|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0088|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0088|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0089|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0089|assertEqual|expected', QueryPhase.TIMEOUT));
      f.api.rejectNext(new TestBusinessError(16000050, 'late failure releases slot'));
      await flushMicrotasks();

      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0090|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0090|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0091|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0091|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0092|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0092|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0093|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0093|assertEqual|expected', QueryPhase.QUERYING));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0094|assertTrue|actual|expected=true', f.service.snapshot().pending)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0095|assertEqual|actual', f.service.snapshot().errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0095|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0096|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0096|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0097|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0097|assertEqual|expected', '等待超时'));
      f.clock.advance(8);
      f.api.resolveNext(false);
      await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0098|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0098|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0099|assertEqual|actual', f.service.records()[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0099|assertEqual|expected', RefreshSource.SETTINGS));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0100|assertEqual|actual', f.service.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0100|assertEqual|expected', 8));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0101|assertEqual|actual', f.service.records()[1].errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0101|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0102|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0102|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0103|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0006|AutoStartupAdditional.test.ets|assert0103|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0700
     * @tc.name      testAutoStartupAdditionalBranches0007
     * @tc.desc      Verify throwing subscriber does not block other listeners or query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0007', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      let throwingCalls: number = 0;
      let observerCalls: number = 0;
      const unsubscribeThrowing = f.service.subscribe((): void => {
        throwingCalls++;
        throw new Error('page callback failure');
      });
      const unsubscribeObserver = f.service.subscribe((): void => {
        observerCalls++;
      });
      f.service.refresh(RefreshSource.INITIAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0104|assertEqual|actual', throwingCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0104|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0105|assertEqual|actual', observerCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0105|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0106|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0106|assertEqual|expected', QueryPhase.QUERYING));
      f.api.resolveNext(true);
      await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0107|assertEqual|actual', throwingCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0107|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0108|assertEqual|actual', observerCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0108|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0109|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0109|assertEqual|expected', QueryPhase.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0110|assertEqual|actual', f.service.snapshot().errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0110|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0111|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0111|assertEqual|expected', 1));
      unsubscribeThrowing();
      unsubscribeThrowing();
      f.service.clearRecords();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0112|assertEqual|actual', throwingCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0112|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0113|assertEqual|actual', observerCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0113|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0007|AutoStartupAdditional.test.ets|assert0114|assertTrue|actual|expected=true', f.service.snapshot().value)).assertTrue();
      unsubscribeObserver();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0800
     * @tc.name      testAutoStartupAdditionalBranches0008
     * @tc.desc      Verify subscription changes during notify respect snapshot and identity
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0008', 0, () => {
      configureTestText();
      const f = fixture;
      let removedCalls: number = 0;
      let addedCalls: number = 0;
      let duplicateCalls: number = 0;
      let removeSecond: () => void = (): void => {};
      let removeAdded: () => void = (): void => {};
      let added: boolean = false;
      const removeFirst = f.service.subscribe((): void => {
        removeSecond();
        if (!added) {
          added = true;
          removeAdded = f.service.subscribe((): void => {
            addedCalls++;
          });
        }
      });
      removeSecond = f.service.subscribe((): void => {
        removedCalls++;
      });
      const duplicate = (): void => {
        duplicateCalls++;
      };
      const removeDuplicateOne = f.service.subscribe(duplicate);
      const removeDuplicateTwo = f.service.subscribe(duplicate);
      f.service.clearRecords();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0115|assertEqual|actual', removedCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0115|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0116|assertEqual|actual', addedCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0116|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0117|assertEqual|actual', duplicateCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0117|assertEqual|expected', 2));
      removeFirst();
      removeDuplicateOne();
      removeDuplicateOne();
      f.service.clearRecords();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0118|assertEqual|actual', removedCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0118|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0119|assertEqual|actual', addedCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0119|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0120|assertEqual|actual', duplicateCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0120|assertEqual|expected', 3));
      removeSecond();
      removeAdded();
      removeDuplicateTwo();
      f.service.clearRecords();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0121|assertEqual|actual', addedCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0121|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0122|assertEqual|actual', duplicateCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0122|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0123|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0008|AutoStartupAdditional.test.ets|assert0123|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0900
     * @tc.name      testAutoStartupAdditionalBranches0009
     * @tc.desc      Verify probe801 maps to device unsupported without status call
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0009', 0, () => {
      configureTestText();
      const f = fixture;
      f.api.probeError = new TestBusinessError(801, 'capability unavailable');
      f.service.refresh(RefreshSource.INITIAL);
      const snapshot = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0124|assertEqual|actual', snapshot.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0124|assertEqual|expected', QueryPhase.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0125|assertEqual|actual', snapshot.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0125|assertEqual|expected', SupportState.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0126|assertEqual|actual', snapshot.supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0126|assertEqual|expected', '异常'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0127|assertEqual|actual', snapshot.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0127|assertEqual|expected', '未调用'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0128|assertEqual|actual', snapshot.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0128|assertEqual|expected', '801'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0129|assertEqual|actual', snapshot.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0129|assertEqual|expected', 'capability unavailable'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0130|assertFalse|actual|expected=false', snapshot.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0131|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0131|assertEqual|expected', '设备不支持'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0132|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0132|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0133|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0133|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0134|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0134|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0135|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0135|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0136|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0136|assertEqual|expected', '设备不支持'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0137|assertEqual|actual', f.service.records()[0].errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0009|AutoStartupAdditional.test.ets|assert0137|assertEqual|expected', '801'));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1000
     * @tc.name      testAutoStartupAdditionalBranches0010
     * @tc.desc      Verify plain error without business code uses unknown and message
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0010', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(31);
      f.api.rejectNext(new Error('untyped native failure') as BusinessError);
      await flushMicrotasks();
      const snapshot = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0138|assertEqual|actual', snapshot.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0138|assertEqual|expected', QueryPhase.FAILED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0139|assertEqual|actual', snapshot.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0139|assertEqual|expected', SupportState.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0140|assertEqual|actual', snapshot.supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0140|assertEqual|expected', 'true'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0141|assertEqual|actual', snapshot.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0141|assertEqual|expected', 'UNKNOWN'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0142|assertEqual|actual', snapshot.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0142|assertEqual|expected', 'UNKNOWN'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0143|assertEqual|actual', snapshot.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0143|assertEqual|expected', 'untyped native failure'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0144|assertFalse|actual|expected=false', snapshot.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0145|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0145|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0146|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0146|assertEqual|expected', '查询失败'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0147|assertEqual|actual', f.service.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0147|assertEqual|expected', 31));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0148|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0010|AutoStartupAdditional.test.ets|assert0148|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1100
     * @tc.name      testAutoStartupAdditionalBranches0011
     * @tc.desc      Verify null rejection uses safe unknown fallback and releases timer
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0011', 0, async (): Promise<void> => {
      configureTestText();
      const api = new EmptyRejectionApi();
      const clock = new ManualQueryClock();
      const service = new AutoStartupService(api, clock);
      try {
        service.refresh(RefreshSource.INITIAL);
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0149|assertEqual|actual', clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0149|assertEqual|expected', 1));
        await flushMicrotasks();
        const snapshot = service.snapshot();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0150|assertEqual|actual', snapshot.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0150|assertEqual|expected', QueryPhase.FAILED));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0151|assertEqual|actual', snapshot.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0151|assertEqual|expected', SupportState.SUPPORTED));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0152|assertEqual|actual', snapshot.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0152|assertEqual|expected', 'UNKNOWN'));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0153|assertEqual|actual', snapshot.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0153|assertEqual|expected', 'null'));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0154|assertEqual|actual', snapshot.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0154|assertEqual|expected', 'UNKNOWN'));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0155|assertFalse|actual|expected=false', snapshot.pending)).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0156|assertEqual|actual', api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0156|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0157|assertEqual|actual', api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0157|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0158|assertEqual|actual', clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0158|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0159|assertEqual|actual', service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0159|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0160|assertEqual|actual', service.records()[0].errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0011|AutoStartupAdditional.test.ets|assert0160|assertEqual|expected', 'null'));
      } finally {
        service.dispose();
        clock.clearAll();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1200
     * @tc.name      testAutoStartupAdditionalBranches0012
     * @tc.desc      Verify status presentation maps incomplete and terminal states
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0012', 0, () => {
      configureTestText();
      const snapshot = new QuerySnapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0161|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0161|assertEqual|expected', '等待查询'));
      snapshot.phase = QueryPhase.CHECKING;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0162|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0162|assertEqual|expected', '正在查询'));
      snapshot.phase = QueryPhase.QUERYING;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0163|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0163|assertEqual|expected', '正在查询'));
      snapshot.phase = QueryPhase.SUCCEEDED;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0164|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0164|assertEqual|expected', '等待查询'));
      snapshot.value = true;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0165|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0165|assertEqual|expected', '本应用已开启'));
      snapshot.value = false;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0166|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0166|assertEqual|expected', '本应用未开启'));
      snapshot.phase = QueryPhase.UNSUPPORTED;
      snapshot.support = SupportState.UNSUPPORTED;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0167|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0167|assertEqual|expected', '设备不支持'));
      snapshot.support = SupportState.SUPPORTED;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0168|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0168|assertEqual|expected', '查询暂不可用'));
      snapshot.phase = QueryPhase.FAILED;
      snapshot.support = SupportState.FAILED;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0169|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0169|assertEqual|expected', '检测失败'));
      snapshot.support = SupportState.SUPPORTED;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0170|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0170|assertEqual|expected', '查询失败'));
      snapshot.phase = QueryPhase.TIMEOUT;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0171|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0012|AutoStartupAdditional.test.ets|assert0171|assertEqual|expected', '查询超时'));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1300
     * @tc.name      testAutoStartupAdditionalBranches0013
     * @tc.desc      Verify metadata labels cover sources support and uncalled api results
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testAutoStartupAdditionalBranches0013', 0, () => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0172|assertEqual|actual', sourceLabel(RefreshSource.INITIAL))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0172|assertEqual|expected', '首次进入'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0173|assertEqual|actual', sourceLabel(RefreshSource.MANUAL))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0173|assertEqual|expected', '手动刷新'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0174|assertEqual|actual', sourceLabel(RefreshSource.FOREGROUND))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0174|assertEqual|expected', '返回前台'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0175|assertEqual|actual', sourceLabel(RefreshSource.SETTINGS))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0175|assertEqual|expected', '设置后查询'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0176|assertEqual|actual', sourceLabel('UNRECOGNIZED' as RefreshSource))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0176|assertEqual|expected', '查询'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0177|assertEqual|actual', supportLabel(SupportState.UNKNOWN))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0177|assertEqual|expected', '待检测'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0178|assertEqual|actual', supportLabel(SupportState.SUPPORTED))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0178|assertEqual|expected', '支持'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0179|assertEqual|actual', supportLabel(SupportState.UNSUPPORTED))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0179|assertEqual|expected', '不支持'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0180|assertEqual|actual', supportLabel(SupportState.FAILED))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0180|assertEqual|expected', '检测失败'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0181|assertEqual|actual', apiResultLabel(''))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0181|assertEqual|expected', '未调用'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0182|assertEqual|actual', apiResultLabel('待调用'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0182|assertEqual|expected', '未调用'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0183|assertEqual|actual', apiResultLabel('true'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0183|assertEqual|expected', 'true'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0184|assertEqual|actual', apiResultLabel('false'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0184|assertEqual|expected', 'false'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0185|assertEqual|actual', apiResultLabel('调用中'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0185|assertEqual|expected', '调用中'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0186|assertEqual|actual', apiResultLabel('801'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0013|AutoStartupAdditional.test.ets|assert0186|assertEqual|expected', '801'));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1400
     * @tc.name      testAutoStartupAdditionalBranches0014
     * @tc.desc      Verify query time uses local calendar padding and nonpositive sentinel
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0014', 0, () => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0014|AutoStartupAdditional.test.ets|assert0187|assertEqual|actual', formatQueryTime(0))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0014|AutoStartupAdditional.test.ets|assert0187|assertEqual|expected', '未查询'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0014|AutoStartupAdditional.test.ets|assert0188|assertEqual|actual', formatQueryTime(-1))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0014|AutoStartupAdditional.test.ets|assert0188|assertEqual|expected', '未查询'));
      // Construct local wall-clock values, so assertions do not depend on device timezone.
      const padded = new Date(2026, 0, 2, 3, 4, 5).getTime();
      const unpadded = new Date(2026, 10, 12, 13, 24, 35).getTime();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0014|AutoStartupAdditional.test.ets|assert0189|assertEqual|actual', formatQueryTime(padded))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0014|AutoStartupAdditional.test.ets|assert0189|assertEqual|expected', '01-02 03:04:05'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0014|AutoStartupAdditional.test.ets|assert0190|assertEqual|actual', formatQueryTime(unpadded))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupAdditionalBranches_0014|AutoStartupAdditional.test.ets|assert0190|assertEqual|expected', '11-12 13:24:35'));
    });
  });
}
