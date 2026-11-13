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
import { QueryPhase, RefreshSource, SupportState } from '../../../main/ets/autostart/AutoStartupTypes';
import { statusLabel } from '../../../main/ets/components/QueryPresentation';
import { AutoStartupFixture, flushMicrotasks, TestBusinessError } from '../support/TestSupport';

export default function autoStartupTest(): void {
  configureTestText();
  describe('AutoStartupQueries', () => {
    let fixture: AutoStartupFixture = new AutoStartupFixture();

    beforeEach(() => {
      configureTestText();
      fixture = new AutoStartupFixture();
    });

    afterEach(async () => {
      fixture.service.dispose();
      const remainingTimers: number = fixture.clock.pendingCount();
      fixture.clock.clearAll();
      fixture.api.finishPending();
      await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|AutoStartup.test.ets|assert0001|assertEqual|actual', remainingTimers)).assertEqual(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|AutoStartup.test.ets|assert0001|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|AutoStartup.test.ets|assert0002|assertEqual|actual', fixture.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|AutoStartup.test.ets|assert0002|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0100
     * @tc.name      testAutoStartupQueries0001
     * @tc.desc      Verify supported true shows enabled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0001', 0, async () => {
      configureTestText();
      const f = fixture;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0003|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0003|assertEqual|expected', QueryPhase.IDLE));
      f.service.refresh(RefreshSource.INITIAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0004|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0004|assertEqual|expected', QueryPhase.QUERYING));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0005|assertTrue|actual|expected=true', f.service.snapshot().pending)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0006|assertEqual|actual', statusLabel(f.service.snapshot()))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0006|assertEqual|expected', '正在查询'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0007|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0007|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0008|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0008|assertEqual|expected', 1));
      f.clock.advance(25);
      f.api.resolveNext(true);
      await flushMicrotasks();

      const snapshot = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0009|assertEqual|actual', snapshot.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0009|assertEqual|expected', QueryPhase.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0010|assertEqual|actual', snapshot.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0010|assertEqual|expected', SupportState.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0011|assertTrue|actual|expected=true', snapshot.value)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0012|assertTrue|actual|expected=true', snapshot.lastValue)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0013|assertEqual|actual', snapshot.sampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0013|assertEqual|expected', f.clock.now()));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0014|assertEqual|actual', snapshot.lastSampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0014|assertEqual|expected', snapshot.sampleTime));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0015|assertFalse|actual|expected=false', snapshot.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0016|assertEqual|actual', snapshot.supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0016|assertEqual|expected', 'true'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0017|assertEqual|actual', snapshot.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0017|assertEqual|expected', 'true'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0018|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0018|assertEqual|expected', '本应用已开启'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0019|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0019|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0020|assertEqual|actual', f.service.records()[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0020|assertEqual|expected', RefreshSource.INITIAL));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0021|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0021|assertEqual|expected', '已开启'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0022|assertEqual|actual', f.service.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0022|assertEqual|expected', 25));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0023|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0001|AutoStartup.test.ets|assert0023|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0200
     * @tc.name      testAutoStartupQueries0002
     * @tc.desc      Verify supported false shows disabled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0002', 0, async () => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(12);
      f.api.resolveNext(false);
      await flushMicrotasks();

      const snapshot = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0024|assertEqual|actual', snapshot.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0024|assertEqual|expected', QueryPhase.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0025|assertEqual|actual', snapshot.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0025|assertEqual|expected', SupportState.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0026|assertFalse|actual|expected=false', snapshot.value)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0027|assertFalse|actual|expected=false', snapshot.lastValue)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0028|assertFalse|actual|expected=false', snapshot.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0029|assertEqual|actual', snapshot.supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0029|assertEqual|expected', 'true'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0030|assertEqual|actual', snapshot.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0030|assertEqual|expected', 'false'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0031|assertEqual|actual', snapshot.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0031|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0032|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0032|assertEqual|expected', '本应用未开启'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0033|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0033|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0034|assertEqual|actual', f.service.records()[0].statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0034|assertEqual|expected', 'false'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0035|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0002|AutoStartup.test.ets|assert0035|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0300
     * @tc.name      testAutoStartupQueries0003
     * @tc.desc      Verify unsupported probe skips status query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0003', 0, () => {
      configureTestText();
      const f = fixture;
      f.api.supported = false;
      f.service.refresh(RefreshSource.INITIAL);

      const snapshot = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0036|assertEqual|actual', snapshot.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0036|assertEqual|expected', QueryPhase.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0037|assertEqual|actual', snapshot.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0037|assertEqual|expected', SupportState.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0038|assertNull|actual|expected=null', snapshot.value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0039|assertFalse|actual|expected=false', snapshot.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0040|assertEqual|actual', snapshot.supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0040|assertEqual|expected', 'false'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0041|assertEqual|actual', snapshot.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0041|assertEqual|expected', '未调用'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0042|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0042|assertEqual|expected', '设备不支持'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0043|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0043|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0044|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0044|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0045|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0045|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0046|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0046|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0047|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0047|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0048|assertEqual|actual', f.service.records()[0].statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0003|AutoStartup.test.ets|assert0048|assertEqual|expected', '未调用'));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0400
     * @tc.name      testAutoStartupQueries0004
     * @tc.desc      Verify probe exception fails without status query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0004', 0, () => {
      configureTestText();
      const f = fixture;
      f.api.probeError = new TestBusinessError(16000050, 'probe unavailable');
      f.service.refresh(RefreshSource.INITIAL);

      const snapshot = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0049|assertEqual|actual', snapshot.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0049|assertEqual|expected', QueryPhase.FAILED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0050|assertEqual|actual', snapshot.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0050|assertEqual|expected', SupportState.FAILED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0051|assertNull|actual|expected=null', snapshot.value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0052|assertFalse|actual|expected=false', snapshot.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0053|assertEqual|actual', snapshot.supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0053|assertEqual|expected', '异常'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0054|assertEqual|actual', snapshot.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0054|assertEqual|expected', '未调用'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0055|assertEqual|actual', snapshot.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0055|assertEqual|expected', '16000050'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0056|assertEqual|actual', snapshot.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0056|assertEqual|expected', 'probe unavailable'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0057|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0057|assertEqual|expected', '检测失败'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0058|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0058|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0059|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0059|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0060|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0060|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0061|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0061|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0062|assertEqual|actual', f.service.records()[0].errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0004|AutoStartup.test.ets|assert0062|assertEqual|expected', 'probe unavailable'));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0500
     * @tc.name      testAutoStartupQueries0005
     * @tc.desc      Verify query801 keeps successful support probe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0005', 0, async () => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.api.rejectNext(new TestBusinessError(801, 'status unsupported'));
      await flushMicrotasks();

      const snapshot = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0063|assertEqual|actual', snapshot.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0063|assertEqual|expected', QueryPhase.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0064|assertEqual|actual', snapshot.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0064|assertEqual|expected', SupportState.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0065|assertNull|actual|expected=null', snapshot.value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0066|assertFalse|actual|expected=false', snapshot.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0067|assertEqual|actual', snapshot.supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0067|assertEqual|expected', 'true'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0068|assertEqual|actual', snapshot.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0068|assertEqual|expected', '801'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0069|assertEqual|actual', snapshot.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0069|assertEqual|expected', '801'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0070|assertEqual|actual', snapshot.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0070|assertEqual|expected', 'status unsupported'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0071|assertEqual|actual', statusLabel(snapshot))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0071|assertEqual|expected', '查询暂不可用'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0072|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0072|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0073|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0073|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0074|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0074|assertEqual|expected', '查询不支持'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0075|assertEqual|actual', f.service.records()[0].supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0075|assertEqual|expected', 'true'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0076|assertEqual|actual', f.service.records()[0].errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0076|assertEqual|expected', '801'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0077|assertEqual|actual', f.service.records()[0].errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0005|AutoStartup.test.ets|assert0077|assertEqual|expected', 'status unsupported'));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0600
     * @tc.name      testAutoStartupQueries0006
     * @tc.desc      Verify query failure preserves last successful sample
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0006', 0, async () => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(17);
      f.api.resolveNext(true);
      await flushMicrotasks();
      const successful = f.service.snapshot();

      f.clock.advance(100);
      f.service.refresh(RefreshSource.MANUAL);
      f.clock.advance(7);
      f.api.rejectNext(new TestBusinessError(16000050, 'status unavailable'));
      await flushMicrotasks();

      const failed = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0078|assertEqual|actual', failed.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0078|assertEqual|expected', QueryPhase.FAILED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0079|assertEqual|actual', failed.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0079|assertEqual|expected', SupportState.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0080|assertNull|actual|expected=null', failed.value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0081|assertEqual|actual', failed.lastValue)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0081|assertEqual|expected', successful.value));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0082|assertEqual|actual', failed.lastSampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0082|assertEqual|expected', successful.sampleTime));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0083|assertEqual|actual', failed.sampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0083|assertEqual|expected', f.clock.now()));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0084|assertFalse|actual|expected=false', failed.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0085|assertEqual|actual', failed.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0085|assertEqual|expected', '16000050'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0086|assertEqual|actual', failed.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0086|assertEqual|expected', '16000050'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0087|assertEqual|actual', failed.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0087|assertEqual|expected', 'status unavailable'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0088|assertEqual|actual', statusLabel(failed))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0088|assertEqual|expected', '查询失败'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0089|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0089|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0090|assertEqual|actual', f.service.records()[0].errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0090|assertEqual|expected', '16000050'));

      f.api.queryError = new TestBusinessError(16000050, 'synchronous status failure');
      f.service.refresh(RefreshSource.MANUAL);
      const synchronous = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0091|assertEqual|actual', synchronous.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0091|assertEqual|expected', QueryPhase.FAILED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0092|assertEqual|actual', synchronous.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0092|assertEqual|expected', SupportState.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0093|assertEqual|actual', synchronous.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0093|assertEqual|expected', failed.errorCode));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0094|assertEqual|actual', synchronous.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0094|assertEqual|expected', 'synchronous status failure'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0095|assertEqual|actual', synchronous.lastValue)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0095|assertEqual|expected', successful.value));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0096|assertEqual|actual', synchronous.lastSampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0096|assertEqual|expected', successful.sampleTime));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0006|AutoStartup.test.ets|assert0097|assertFalse|actual|expected=false', synchronous.pending)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0700
     * @tc.name      testAutoStartupQueries0007
     * @tc.desc      Verify repeated refresh keeps one in flight query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0007', 0, async () => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      for (let index = 0; index < 10; index++) {
        f.service.refresh(RefreshSource.MANUAL);
        f.service.refresh(RefreshSource.INITIAL);
      }
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0098|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0098|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0099|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0099|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0100|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0100|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0101|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0101|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0102|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0102|assertEqual|expected', 0));
      f.api.resolveNext(true);
      await flushMicrotasks();

      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0103|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0103|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0104|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0104|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0105|assertFalse|actual|expected=false', f.service.snapshot().pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0106|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0106|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0107|assertEqual|actual', f.service.records()[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0107|assertEqual|expected', RefreshSource.INITIAL));
      f.service.refresh(RefreshSource.INITIAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0108|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0007|AutoStartup.test.ets|assert0108|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0800
     * @tc.name      testAutoStartupQueries0008
     * @tc.desc      Verify settings and foreground merge into one follow up
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0008', 0, async () => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.FOREGROUND);
      f.service.refresh(RefreshSource.SETTINGS);
      f.service.onBackground();
      f.service.onForeground();
      f.service.refresh(RefreshSource.SETTINGS);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0109|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0109|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0110|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0110|assertEqual|expected', 1));
      f.api.resolveNext(true);
      await flushMicrotasks();

      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0111|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0111|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0112|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0112|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0113|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0113|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0114|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0114|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0115|assertTrue|actual|expected=true', f.service.snapshot().pending)).assertTrue();
      f.clock.advance(10);
      f.api.resolveNext(false);
      await flushMicrotasks();

      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0116|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0116|assertEqual|expected', QueryPhase.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0117|assertFalse|actual|expected=false', f.service.snapshot().value)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0118|assertFalse|actual|expected=false', f.service.snapshot().pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0119|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0119|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0120|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0120|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0121|assertEqual|actual', f.service.records()[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0121|assertEqual|expected', RefreshSource.SETTINGS));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0122|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0122|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0123|assertEqual|actual', f.service.records()[1].source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0123|assertEqual|expected', RefreshSource.INITIAL));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0124|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0008|AutoStartup.test.ets|assert0124|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0900
     * @tc.name      testAutoStartupQueries0009
     * @tc.desc      Verify timeout keeps pending and discards late result
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0009', 0, async () => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(4999);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0125|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0125|assertEqual|expected', QueryPhase.QUERYING));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0126|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0126|assertEqual|expected', 0));
      f.clock.advance(1);

      const timedOut = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0127|assertEqual|actual', timedOut.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0127|assertEqual|expected', QueryPhase.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0128|assertEqual|actual', timedOut.support)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0128|assertEqual|expected', SupportState.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0129|assertNull|actual|expected=null', timedOut.value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0130|assertTrue|actual|expected=true', timedOut.pending)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0131|assertEqual|actual', timedOut.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0131|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0132|assertEqual|actual', statusLabel(timedOut))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0132|assertEqual|expected', '查询超时'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0133|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0133|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0134|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0134|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0135|assertEqual|actual', f.service.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0135|assertEqual|expected', 5000));
      f.service.refresh(RefreshSource.MANUAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0136|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0136|assertEqual|expected', 1));
      f.api.resolveNext(true);
      await flushMicrotasks();

      const late = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0137|assertEqual|actual', late.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0137|assertEqual|expected', QueryPhase.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0138|assertNull|actual|expected=null', late.value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0139|assertFalse|actual|expected=false', late.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0140|assertEqual|actual', late.sampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0140|assertEqual|expected', timedOut.sampleTime));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0141|assertEqual|actual', late.supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0141|assertEqual|expected', timedOut.supportResult));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0142|assertEqual|actual', late.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0142|assertEqual|expected', timedOut.statusResult));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0143|assertEqual|actual', late.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0143|assertEqual|expected', timedOut.errorCode));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0144|assertNull|actual|expected=null', late.lastValue)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0145|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0145|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0146|assertEqual|actual', f.service.records()[0].errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0146|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0147|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0009|AutoStartup.test.ets|assert0147|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_1000
     * @tc.name      testAutoStartupQueries0010
     * @tc.desc      Verify history is bounded copied and cleared independently
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0010', 0, async () => {
      configureTestText();
      const f = fixture;
      for (let index = 0; index < 21; index++) {
        f.clock.advance(10);
        f.service.refresh(index === 0 ? RefreshSource.INITIAL : RefreshSource.MANUAL);
        f.api.resolveNext(index % 2 === 0);
        await flushMicrotasks();
      }
      const records = f.service.records();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0148|assertEqual|actual', records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0148|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0149|assertEqual|actual', records[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0149|assertEqual|expected', 21));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0150|assertEqual|actual', records[19].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0150|assertEqual|expected', 2));
      for (let index = 0; index < records.length - 1; index++) {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0151|assertTrue|actual|expected=true', records[index].timestamp > records[index + 1].timestamp)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0152|assertTrue|actual|expected=true', records[index].id > records[index + 1].id)).assertTrue();
      }
      records[0].id = -1;
      records[0].result = 'modified';
      records[0].errorMessage = 'modified';
      records.pop();
      const unchanged = f.service.records();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0153|assertEqual|actual', unchanged.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0153|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0154|assertEqual|actual', unchanged[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0154|assertEqual|expected', 21));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0155|assertEqual|actual', unchanged[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0155|assertEqual|expected', '已开启'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0156|assertEqual|actual', unchanged[0].errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0156|assertEqual|expected', ''));

      const beforeClear = f.service.snapshot();
      const snapshotCopy = f.service.snapshot();
      snapshotCopy.value = false;
      snapshotCopy.phase = QueryPhase.FAILED;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0157|assertTrue|actual|expected=true', f.service.snapshot().value)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0158|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0158|assertEqual|expected', QueryPhase.SUCCEEDED));
      f.service.clearRecords();
      const afterClear = f.service.snapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0159|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0159|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0160|assertEqual|actual', afterClear.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0160|assertEqual|expected', beforeClear.phase));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0161|assertEqual|actual', afterClear.value)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0161|assertEqual|expected', beforeClear.value));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0162|assertEqual|actual', afterClear.sampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0162|assertEqual|expected', beforeClear.sampleTime));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0163|assertEqual|actual', afterClear.lastValue)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0163|assertEqual|expected', beforeClear.lastValue));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0164|assertEqual|actual', afterClear.lastSampleTime)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0164|assertEqual|expected', beforeClear.lastSampleTime));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0165|assertEqual|actual', afterClear.supportResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0165|assertEqual|expected', beforeClear.supportResult));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0166|assertEqual|actual', afterClear.statusResult)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0166|assertEqual|expected', beforeClear.statusResult));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0167|assertFalse|actual|expected=false', afterClear.pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0168|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0168|assertEqual|expected', 21));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0169|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupQueries_0010|AutoStartup.test.ets|assert0169|assertEqual|expected', 0));
    });
  });
}
