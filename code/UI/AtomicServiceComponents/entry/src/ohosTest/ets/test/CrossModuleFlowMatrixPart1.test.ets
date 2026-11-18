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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { DownloadTarget, resolveDownloadTarget, DownloadState, nextDownloadState } from '../../../main/ets/model/DownloadFlow';
import { LogItem, LogLevel, appendLog, queryLogs } from '../../../main/ets/model/LogStore';
import { normalizePrefsText, canSaveText, buildPrefsSummary } from '../../../main/ets/model/PrefsStore';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function CrossModuleFlowMatrixPart1Test(): void {
  describe('CrossModuleFlowMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_0100
     * @tc.name      testDownloadLogPrefs0001
     * @tc.desc      Verify phone success=true text='' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0001 begin');
      await delayTick();
      const target = resolveDownloadTarget('phone');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, true);
      expect(state).assertEqual(DownloadState.SUCCESS);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', '', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('')).assertEqual('');
      expect(canSaveText('')).assertEqual(false);
      expect(buildPrefsSummary('', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_0200
     * @tc.name      testDownloadLogPrefs0002
     * @tc.desc      Verify phone success=true text='hello' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0002 begin');
      await delayTick();
      const target = resolveDownloadTarget('phone');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, true);
      expect(state).assertEqual(DownloadState.SUCCESS);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', 'hello', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('hello')).assertEqual('hello');
      expect(canSaveText('hello')).assertEqual(true);
      expect(buildPrefsSummary('hello', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_0300
     * @tc.name      testDownloadLogPrefs0003
     * @tc.desc      Verify phone success=false text='' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0003 begin');
      await delayTick();
      const target = resolveDownloadTarget('phone');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, false);
      expect(state).assertEqual(DownloadState.FALLBACK);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', '', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('')).assertEqual('');
      expect(canSaveText('')).assertEqual(false);
      expect(buildPrefsSummary('', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_0400
     * @tc.name      testDownloadLogPrefs0004
     * @tc.desc      Verify phone success=false text='hello' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0004 begin');
      await delayTick();
      const target = resolveDownloadTarget('phone');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, false);
      expect(state).assertEqual(DownloadState.FALLBACK);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', 'hello', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('hello')).assertEqual('hello');
      expect(canSaveText('hello')).assertEqual(true);
      expect(buildPrefsSummary('hello', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_0500
     * @tc.name      testDownloadLogPrefs0005
     * @tc.desc      Verify tablet success=true text='' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0005 begin');
      await delayTick();
      const target = resolveDownloadTarget('tablet');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, true);
      expect(state).assertEqual(DownloadState.SUCCESS);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', '', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('')).assertEqual('');
      expect(canSaveText('')).assertEqual(false);
      expect(buildPrefsSummary('', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_0600
     * @tc.name      testDownloadLogPrefs0006
     * @tc.desc      Verify tablet success=true text='hello' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0006 begin');
      await delayTick();
      const target = resolveDownloadTarget('tablet');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, true);
      expect(state).assertEqual(DownloadState.SUCCESS);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', 'hello', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('hello')).assertEqual('hello');
      expect(canSaveText('hello')).assertEqual(true);
      expect(buildPrefsSummary('hello', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_0700
     * @tc.name      testDownloadLogPrefs0007
     * @tc.desc      Verify tablet success=false text='' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0007 begin');
      await delayTick();
      const target = resolveDownloadTarget('tablet');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, false);
      expect(state).assertEqual(DownloadState.FALLBACK);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', '', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('')).assertEqual('');
      expect(canSaveText('')).assertEqual(false);
      expect(buildPrefsSummary('', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_0800
     * @tc.name      testDownloadLogPrefs0008
     * @tc.desc      Verify tablet success=false text='hello' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0008 begin');
      await delayTick();
      const target = resolveDownloadTarget('tablet');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, false);
      expect(state).assertEqual(DownloadState.FALLBACK);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', 'hello', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('hello')).assertEqual('hello');
      expect(canSaveText('hello')).assertEqual(true);
      expect(buildPrefsSummary('hello', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_0900
     * @tc.name      testDownloadLogPrefs0009
     * @tc.desc      Verify 2in1 success=true text='' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0009 begin');
      await delayTick();
      const target = resolveDownloadTarget('2in1');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, true);
      expect(state).assertEqual(DownloadState.SUCCESS);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', '', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('')).assertEqual('');
      expect(canSaveText('')).assertEqual(false);
      expect(buildPrefsSummary('', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1000
     * @tc.name      testDownloadLogPrefs0010
     * @tc.desc      Verify 2in1 success=true text='hello' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0010 begin');
      await delayTick();
      const target = resolveDownloadTarget('2in1');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, true);
      expect(state).assertEqual(DownloadState.SUCCESS);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', 'hello', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('hello')).assertEqual('hello');
      expect(canSaveText('hello')).assertEqual(true);
      expect(buildPrefsSummary('hello', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1100
     * @tc.name      testDownloadLogPrefs0011
     * @tc.desc      Verify 2in1 success=false text='' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0011 begin');
      await delayTick();
      const target = resolveDownloadTarget('2in1');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, false);
      expect(state).assertEqual(DownloadState.FALLBACK);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', '', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('')).assertEqual('');
      expect(canSaveText('')).assertEqual(false);
      expect(buildPrefsSummary('', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1200
     * @tc.name      testDownloadLogPrefs0012
     * @tc.desc      Verify 2in1 success=false text='hello' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0012 begin');
      await delayTick();
      const target = resolveDownloadTarget('2in1');
      expect(target).assertEqual(DownloadTarget.PICKER);
      const state = nextDownloadState(DownloadState.IDLE, false);
      expect(state).assertEqual(DownloadState.FALLBACK);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', 'hello', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('hello')).assertEqual('hello');
      expect(canSaveText('hello')).assertEqual(true);
      expect(buildPrefsSummary('hello', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1300
     * @tc.name      testDownloadLogPrefs0013
     * @tc.desc      Verify watch success=true text='' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0013 begin');
      await delayTick();
      const target = resolveDownloadTarget('watch');
      expect(target).assertEqual(DownloadTarget.SANDBOX);
      const state = nextDownloadState(DownloadState.IDLE, true);
      expect(state).assertEqual(DownloadState.SUCCESS);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', '', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('')).assertEqual('');
      expect(canSaveText('')).assertEqual(false);
      expect(buildPrefsSummary('', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1400
     * @tc.name      testDownloadLogPrefs0014
     * @tc.desc      Verify watch success=true text='hello' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0014 begin');
      await delayTick();
      const target = resolveDownloadTarget('watch');
      expect(target).assertEqual(DownloadTarget.SANDBOX);
      const state = nextDownloadState(DownloadState.IDLE, true);
      expect(state).assertEqual(DownloadState.SUCCESS);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', 'hello', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('hello')).assertEqual('hello');
      expect(canSaveText('hello')).assertEqual(true);
      expect(buildPrefsSummary('hello', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1500
     * @tc.name      testDownloadLogPrefs0015
     * @tc.desc      Verify watch success=false text='' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0015 begin');
      await delayTick();
      const target = resolveDownloadTarget('watch');
      expect(target).assertEqual(DownloadTarget.SANDBOX);
      const state = nextDownloadState(DownloadState.IDLE, false);
      expect(state).assertEqual(DownloadState.FALLBACK);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', '', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('')).assertEqual('');
      expect(canSaveText('')).assertEqual(false);
      expect(buildPrefsSummary('', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1600
     * @tc.name      testDownloadLogPrefs0016
     * @tc.desc      Verify watch success=false text='hello' flow.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDownloadLogPrefs0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0016 begin');
      await delayTick();
      const target = resolveDownloadTarget('watch');
      expect(target).assertEqual(DownloadTarget.SANDBOX);
      const state = nextDownloadState(DownloadState.IDLE, false);
      expect(state).assertEqual(DownloadState.FALLBACK);
      let logs: LogItem[] = appendLog([], new LogItem('device', 'download', 'hello', LogLevel.INFO), 5);
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(1);
      expect(normalizePrefsText('hello')).assertEqual('hello');
      expect(canSaveText('hello')).assertEqual(true);
      expect(buildPrefsSummary('hello', 1)).assertContain('read 1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadLogPrefs0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1700
     * @tc.name      testLogCountLimit0017
     * @tc.desc      Verify 0 logs with limit 0 return 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0017 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 0; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 0);
      expect(hits.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1800
     * @tc.name      testLogCountLimit0018
     * @tc.desc      Verify 0 logs with limit 1 return 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0018 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 0; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 1);
      expect(hits.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_1900
     * @tc.name      testLogCountLimit0019
     * @tc.desc      Verify 0 logs with limit 3 return 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0019 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 0; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 3);
      expect(hits.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2000
     * @tc.name      testLogCountLimit0020
     * @tc.desc      Verify 1 logs with limit 0 return 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0020 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 1; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 0);
      expect(hits.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2100
     * @tc.name      testLogCountLimit0021
     * @tc.desc      Verify 1 logs with limit 1 return 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0021 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 1; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 1);
      expect(hits.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2200
     * @tc.name      testLogCountLimit0022
     * @tc.desc      Verify 1 logs with limit 3 return 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0022 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 1; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 3);
      expect(hits.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2300
     * @tc.name      testLogCountLimit0023
     * @tc.desc      Verify 3 logs with limit 0 return 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0023 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 0);
      expect(hits.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2400
     * @tc.name      testLogCountLimit0024
     * @tc.desc      Verify 3 logs with limit 1 return 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0024 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 1);
      expect(hits.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2500
     * @tc.name      testLogCountLimit0025
     * @tc.desc      Verify 3 logs with limit 3 return 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0025 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 3);
      expect(hits.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2600
     * @tc.name      testLogCountLimit0026
     * @tc.desc      Verify 5 logs with limit 0 return 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0026 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 5; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 0);
      expect(hits.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2700
     * @tc.name      testLogCountLimit0027
     * @tc.desc      Verify 5 logs with limit 1 return 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0027 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 5; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 1);
      expect(hits.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2800
     * @tc.name      testLogCountLimit0028
     * @tc.desc      Verify 5 logs with limit 3 return 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0028 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 5; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 3);
      expect(hits.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_2900
     * @tc.name      testLogCountLimit0029
     * @tc.desc      Verify 10 logs with limit 0 return 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0029 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 0);
      expect(hits.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_3000
     * @tc.name      testLogCountLimit0030
     * @tc.desc      Verify 10 logs with limit 1 return 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0030 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 1);
      expect(hits.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_CMFP1_3100
     * @tc.name      testLogCountLimit0031
     * @tc.desc      Verify 10 logs with limit 3 return 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogCountLimit0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0031 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('device', 't', 'd' + i, LogLevel.INFO), 20);
      }
      const hits = queryLogs(logs, 'device', LogLevel.DEBUG, 'd', 3);
      expect(hits.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogCountLimit0031 end');
    })

  })
}
