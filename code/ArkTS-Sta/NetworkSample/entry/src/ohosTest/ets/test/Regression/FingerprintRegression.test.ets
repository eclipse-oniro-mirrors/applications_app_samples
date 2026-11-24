'use static';
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

/**
 * FingerprintRegression suite of the NetworkSample ohosTest module.
 *
 * The suite freezes the text projections of the page as regression oracles:
 * snapshot traces, event traces, metrics fingerprints, request configuration
 * descriptions and resource names. Two runs of the same script must hash to
 * the same value, while a single changed field must change it. Every hash is
 * compared with the shared text fingerprint helper rather than with a literal
 * copied from a previous run.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-148  download(): action DOWNLOAD, method GET, saveas './', overwrite
 *   151-171  the three URL literals of task A, B and C
 *   200-265  the progress labels and the start button state
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  CONFIG_ACTION_DOWNLOAD,
  CONFIG_METHOD_GET,
  CONFIG_SAVEAS_CACHE,
  STATUS_IDLE,
  STATUS_RUNNING,
  PROGRESS_TOTAL,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  TaskGraph,
  createTaskGraph,
  DownloadConfig,
  UrlExpectation,
  expectationFor,
  textFingerprint,
  NetworkMetrics,
  completionTrace,
  isTopologicalCompletion,
  fileNameOf,
  extensionOf,
  hostOf,
  schemeOf,
  expectedConfigFor
} from '../Shared/SharedDriver';

export default function fingerprintRegressionTest(): void {
  describe('FingerprintRegression', () => {
    beforeAll(() => {
      logSuite('FingerprintRegression', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('FingerprintRegression', 'end');
    });

    /**
     * @tc.name   fingerprintRegressionSnapshotTraceOfFreshGraph
     * @tc.desc   The frozen trace of a fresh graph is the three idle triples joined with pipe separators.
     * @tc.precondition  The shared driver is loaded and a fresh graph owns three untouched rows.
     * @tc.steps         1. Capture the fresh graph into a SnapshotLog.
     *                   2. Read the trace and its segment count.
     *                   3. Compare the text with the frozen literal.
     * @tc.expected      The trace is A/idle/0|B/idle/0|C/idle/0 with three segments.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionSnapshotTraceOfFreshGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const trace: string = log.trace();
      logStep('FingerprintRegression', 'fresh trace ' + trace);
      expect(trace).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(trace.split('|').length).assertEqual(3);
      expect(log.size()).assertEqual(3);
      expect(trace.indexOf('/idle/')).assertLarger(0);
      expect(trace.startsWith('A/')).assertTrue();
      expect(trace.endsWith('/0')).assertTrue();
    });

    /**
     * @tc.name   fingerprintRegressionSnapshotTraceOrderTaskAFirst
     * @tc.desc   The capture order follows the task array, so A is always first and C always last.
     * @tc.precondition  The shared driver is loaded and the graph rows were created in A, B, C order.
     * @tc.steps         1. Capture the fresh graph.
     *                   2. Read the first and last snapshot task numbers.
     *                   3. Read latest for A and for C.
     * @tc.expected      The first entry is A, the last is C and both latest lookups agree.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionSnapshotTraceOrderTaskAFirst', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const first: RunSnapshot = log.snapshots[0];
      const last: RunSnapshot = log.snapshots[2];
      const latestA: RunSnapshot = log.latest(TASK_A) as RunSnapshot;
      const latestC: RunSnapshot = log.latest(TASK_C) as RunSnapshot;
      logStep('FingerprintRegression', 'order ' + first.describe() + ' .. ' + last.describe());
      expect(first.taskNo).assertEqual(TASK_A);
      expect(last.taskNo).assertEqual(TASK_C);
      expect(latestA.taskNo).assertEqual(TASK_A);
      expect(latestC.taskNo).assertEqual(TASK_C);
      expect(first.describe()).assertEqual('A/idle/0');
      expect(last.describe()).assertEqual('C/idle/0');
      expect(log.latest(TASK_B) !== undefined).assertTrue();
    });

    /**
     * @tc.name   fingerprintRegressionSnapshotFingerprintMatchesManualHash
     * @tc.desc   The log fingerprint equals the shared text hash of the same trace, so the oracle is reproducible.
     * @tc.precondition  The shared driver is loaded and textFingerprint is exported by the shared driver.
     * @tc.steps         1. Capture the fresh graph and read the trace.
     *                   2. Hash the trace with textFingerprint.
     *                   3. Compare the hash with a second hash of the same text.
     * @tc.expected      Both hashes match, are non-zero and differ from the empty seed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionSnapshotFingerprintMatchesManualHash', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const trace: string = log.trace();
      const manual: number = textFingerprint(trace);
      logStep('FingerprintRegression', 'manual trace hash ' + String(manual));
      expect(manual).assertEqual(textFingerprint(log.trace()));
      expect(manual).assertEqual(textFingerprint('A/idle/0|B/idle/0|C/idle/0'));
      expect(manual === textFingerprint('')).assertFalse();
      expect(manual).assertLarger(0);
      expect(trace.length).assertLarger(0);
      expect(manual).assertLess(1000003);
    });

    /**
     * @tc.name   fingerprintRegressionRepeatedCaptureGrowsLog
     * @tc.desc   Four capture rounds append twelve snapshots and every round preserves the fresh triple prefix.
     * @tc.precondition  The shared driver is loaded and a snapshot log starts empty.
     * @tc.steps         1. Capture the same graph four times.
     *                   2. Read the size and split the trace.
     *                   3. Compare the trace prefix with the first round.
     * @tc.expected      The log holds twelve entries and the prefix is still the fresh triple.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionRepeatedCaptureGrowsLog', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const prefix: string = log.trace();
      log.capture(graph.tasks);
      log.capture(graph.tasks);
      log.capture(graph.tasks);
      const trace: string = log.trace();
      logStep('FingerprintRegression', 'repeated captures ' + String(log.size()));
      expect(log.size()).assertEqual(12);
      expect(trace.split('|').length).assertEqual(12);
      expect(trace.startsWith(prefix)).assertTrue();
      expect(prefix).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(log.snapshots[11].taskNo).assertEqual(TASK_C);
      expect(trace.length).assertLarger(prefix.length);
    });

    /**
     * @tc.name   fingerprintRegressionTraceStableAcrossEquivalentRuns
     * @tc.desc   Two graphs that apply the same progress values produce the same trace and the same trace hash.
     * @tc.precondition  The shared driver is loaded and both graphs are fresh before the progress reports.
     * @tc.steps         1. Report 15, 35 and 55 percent on both graphs.
     *                   2. Capture both graphs once.
     *                   3. Compare traces and hashes.
     * @tc.expected      The traces are identical and both hashes match each other.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionTraceStableAcrossEquivalentRuns', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      const firstLog: SnapshotLog = new SnapshotLog();
      const secondLog: SnapshotLog = new SnapshotLog();
      first.taskAt(0).reportProgress(15);
      second.taskAt(0).reportProgress(15);
      first.taskAt(1).reportProgress(35);
      second.taskAt(1).reportProgress(35);
      first.taskAt(2).reportProgress(55);
      second.taskAt(2).reportProgress(55);
      firstLog.capture(first.tasks);
      secondLog.capture(second.tasks);
      const latestB: RunSnapshot | undefined = firstLog.latest(TASK_B);
      logStep('FingerprintRegression', 'equivalent traces ' + firstLog.trace());
      expect(firstLog.trace()).assertEqual(secondLog.trace());
      expect(textFingerprint(firstLog.trace())).assertEqual(textFingerprint(secondLog.trace()));
      expect(firstLog.size()).assertEqual(secondLog.size());
      expect(firstLog.trace()).assertEqual('A/idle/15|B/idle/35|C/idle/55');
      expect(firstLog.trace() === secondLog.trace()).assertTrue();
      expect(latestB !== undefined).assertTrue();
      if (latestB !== undefined) {
        expect(latestB.progress).assertEqual(35);
      }
    });

    /**
     * @tc.name   fingerprintRegressionTraceChangesAfterProgress
     * @tc.desc   A single progress point is enough to change the trace text and therefore its fingerprint.
     * @tc.precondition  The shared driver is loaded and one graph is captured before and after a report.
     * @tc.steps         1. Capture the graph and read trace and hash.
     *                   2. Report 50 percent on row A and capture again.
     *                   3. Compare both traces and both hashes.
     * @tc.expected      The later trace contains 50 and both trace and hash differ from the first.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionTraceChangesAfterProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const beforeTrace: string = log.trace();
      const beforeHash: number = textFingerprint(beforeTrace);
      graph.taskAt(0).reportProgress(50);
      log.capture(graph.tasks);
      const afterTrace: string = log.trace();
      const afterHash: number = textFingerprint(afterTrace);
      logStep('FingerprintRegression', 'changed trace ' + afterTrace);
      expect(afterTrace.indexOf('A/idle/50')).assertLarger(0);
      expect(afterTrace === beforeTrace).assertFalse();
      expect(afterHash === beforeHash).assertFalse();
      expect(afterTrace.startsWith(beforeTrace)).assertTrue();
      expect(log.size()).assertEqual(6);
      expect(beforeHash).assertLarger(0);
    });

    /**
     * @tc.name   fingerprintRegressionConfigForEachTaskValid
     * @tc.desc   Every task maps to a valid download request with the four page literals and its own URL.
     * @tc.precondition  The shared driver is loaded and DownloadConfig.forTask is available.
     * @tc.steps         1. Build the config for tasks A, B and C.
     *                   2. Validate each config and read the fields.
     *                   3. Compare the shared literals.
     * @tc.expected      All three configs are valid with DOWNLOAD, GET, overwrite true and cache saveas.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionConfigForEachTaskValid', 0, () => {
      const configs: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C)
      ];
      let invalid: number = 0;
      for (let index: int = 0; index < configs.length; index++) {
        if (!configs[index].isValid()) {
          invalid = invalid + 1;
        }
      }
      logStep('FingerprintRegression', 'valid configs ' + String(configs.length - invalid));
      expect(invalid).assertEqual(0);
      expect(configs[0].action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(configs[1].method).assertEqual(CONFIG_METHOD_GET);
      expect(configs[2].saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(configs[0].overwrite).assertTrue();
      expect(configs[0].url).assertEqual(URL_TASK_A);
      expect(configs[2].validate().length).assertEqual(0);
    });

    /**
     * @tc.name   fingerprintRegressionConfigFingerprintStable
     * @tc.desc   Two separately built configs for the same task have the same description and compare equal.
     * @tc.precondition  The shared driver is loaded and the config factory is pure per task number.
     * @tc.steps         1. Build forTask A twice and describe both.
     *                   2. Compare with sameAs and with the independent oracle.
     *                   3. Clone one config and compare again.
     * @tc.expected      Both descriptions match, sameAs is true and the clone compares equal as well.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionConfigFingerprintStable', 0, () => {
      const first: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const second: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const clone: DownloadConfig = first.clone();
      const oracle: DownloadConfig = expectedConfigFor(TASK_A);
      logStep('FingerprintRegression', 'config describe ' + first.describe());
      expect(first.describe()).assertEqual(second.describe());
      expect(first.sameAs(second)).assertTrue();
      expect(first.sameAs(clone)).assertTrue();
      expect(first.sameAs(oracle)).assertTrue();
      expect(first.url).assertEqual(oracle.url);
      expect(clone.validate().length).assertEqual(0);
      expect(second.isValid()).assertTrue();
    });

    /**
     * @tc.name   fingerprintRegressionConfigCloneIndependent
     * @tc.desc   A clone owns its own fields, so breaking the clone leaves the original request untouched.
     * @tc.precondition  The shared driver is loaded and the original config for task B is valid.
     * @tc.steps         1. Clone the valid config for task B.
     *                   2. Clear the URL on the clone only.
     *                   3. Compare both validation results.
     * @tc.expected      The clone becomes invalid while the original still validates cleanly.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionConfigCloneIndependent', 0, () => {
      const original: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const clone: DownloadConfig = original.clone();
      clone.url = '';
      logStep('FingerprintRegression', 'clone errors ' + String(clone.validate().length));
      expect(clone.isValid()).assertFalse();
      expect(clone.validate().indexOf('url-empty')).assertLarger(-1);
      expect(original.isValid()).assertTrue();
      expect(original.url).assertEqual(URL_TASK_B);
      expect(original.sameAs(clone)).assertFalse();
      expect(clone.describe() === original.describe()).assertFalse();
    });

    /**
     * @tc.name   fingerprintRegressionConfigUrlPerTask
     * @tc.desc   Each task number maps to its own frozen URL literal and never to a neighbour URL.
     * @tc.precondition  The shared driver is loaded and the three URL literals are exported.
     * @tc.steps         1. Build the oracle config for A, B and C.
     *                   2. Read the URL of each config.
     *                   3. Compare each URL with its literal and with the other tasks.
     * @tc.expected      Every config carries its own literal and all three URLs are distinct.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionConfigUrlPerTask', 0, () => {
      const a: DownloadConfig = expectedConfigFor(TASK_A);
      const b: DownloadConfig = expectedConfigFor(TASK_B);
      const c: DownloadConfig = expectedConfigFor(TASK_C);
      logStep('FingerprintRegression', 'urls ' + a.url.length + '/' + b.url.length + '/' + c.url.length);
      expect(a.url).assertEqual(URL_TASK_A);
      expect(b.url).assertEqual(URL_TASK_B);
      expect(c.url).assertEqual(URL_TASK_C);
      expect(a.url === b.url).assertFalse();
      expect(b.url === c.url).assertFalse();
      expect(a.url.startsWith('https://')).assertTrue();
      expect(c.isValid()).assertTrue();
    });

    /**
     * @tc.name   fingerprintRegressionConfigFileNameExtensions
     * @tc.desc   The derived file name and extension of each request match the tail of the frozen URL.
     * @tc.precondition  The shared driver is loaded and DownloadConfig derives the file name from its URL.
     * @tc.steps         1. Read fileName and extension for tasks A and B.
     *                   2. Compare them with fileNameOf and extensionOf on the literals.
     *                   3. Check the extension suffix.
     * @tc.expected      The file names are favor_list_tea.png and after_cache.png with a .png extension.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionConfigFileNameExtensions', 0, () => {
      const a: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const b: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const names: string[] = [a.fileName(), b.fileName(), DownloadConfig.forTask(TASK_C).fileName()];
      logStep('FingerprintRegression', 'file names ' + names.join(','));
      expect(names[0]).assertEqual('favor_list_tea.png');
      expect(names[1]).assertEqual('after_cache.png');
      expect(names[0]).assertEqual(fileNameOf(URL_TASK_A));
      expect(extensionOf(a.url)).assertEqual('.png');
      expect(extensionOf(b.url)).assertEqual(extensionOf(a.url));
      expect(names[0].endsWith('.png')).assertTrue();
      expect(names[2].length).assertLarger(0);
    });

    /**
     * @tc.name   fingerprintRegressionConfigHostsUniform
     * @tc.desc   All three frozen URLs point at the same HTTPS host, so the host is a stable regression anchor.
     * @tc.precondition  The shared driver is loaded and hostOf and schemeOf are exported.
     * @tc.steps         1. Derive host and scheme for all three URLs.
     *                   2. Compare the hosts with each other.
     *                   3. Count the unique hosts.
     * @tc.expected      Every host is gitee.com and every scheme is https.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionConfigHostsUniform', 0, () => {
      const urls: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      let giteeHosts: number = 0;
      for (let index: int = 0; index < urls.length; index++) {
        if (hostOf(urls[index]) === 'gitee.com') {
          giteeHosts = giteeHosts + 1;
        }
      }
      logStep('FingerprintRegression', 'gitee hosts ' + String(giteeHosts));
      expect(giteeHosts).assertEqual(3);
      expect(hostOf(URL_TASK_A)).assertEqual(hostOf(URL_TASK_B));
      expect(hostOf(URL_TASK_C)).assertEqual('gitee.com');
      expect(schemeOf(URL_TASK_A)).assertEqual('https');
      expect(schemeOf(URL_TASK_C)).assertEqual('https');
      expect(hostOf(URL_TASK_A).length).assertLarger(0);
      expect(hostOf(URL_TASK_A) === '').assertFalse();
    });

    /**
     * @tc.name   fingerprintRegressionConfigValidateRejectsEmptyUrl
     * @tc.desc   An unknown task yields an empty URL and validation reports both the empty and the scheme defect.
     * @tc.precondition  The shared driver is loaded and forTask falls back to an empty URL for unknown numbers.
     * @tc.steps         1. Build the config for an unknown task number.
     *                   2. Read the validation list.
     *                   3. Check both expected error tokens.
     * @tc.expected      Two defects are reported, including url-empty and url-not-https.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionConfigValidateRejectsEmptyUrl', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('UNKNOWN');
      const errors: string[] = config.validate();
      logStep('FingerprintRegression', 'unknown config errors ' + errors.join(','));
      expect(config.url).assertEqual('');
      expect(errors.length).assertEqual(2);
      expect(errors.indexOf('url-empty')).assertLarger(-1);
      expect(errors.indexOf('url-not-https')).assertLarger(-1);
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('file');
      expect(errors.length).assertLarger(1);
    });

    /**
     * @tc.name   fingerprintRegressionConfigValidateRejectsHttp
     * @tc.desc   A plain HTTP URL is rejected by the single scheme defect while every other field stays valid.
     * @tc.precondition  The shared driver is loaded and the config constructor accepts five fields.
     * @tc.steps         1. Build a config with an http URL and the page literals.
     *                   2. Read the validation list.
     *                   3. Compare the list length with the single expected defect.
     * @tc.expected      Exactly one defect, url-not-https, is reported.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionConfigValidateRejectsHttp', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', 'http://example.com/a.png', true, 'GET', './');
      const errors: string[] = config.validate();
      logStep('FingerprintRegression', 'http errors ' + errors.join(','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.url.startsWith('http://')).assertTrue();
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(errors.indexOf('url-empty')).assertEqual(-1);
    });

    /**
     * @tc.name   fingerprintRegressionConfigValidateRejectsWrongAction
     * @tc.desc   The action literal must stay DOWNLOAD, so any other action produces exactly one action defect.
     * @tc.precondition  The shared driver is loaded and the URL and other fields are valid.
     * @tc.steps         1. Build a config whose action is UPLOAD.
     *                   2. Read the validation list.
     *                   3. Compare with the DOWNLOAD config validation.
     * @tc.expected      The upload config reports only action-not-download while the download config is clean.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionConfigValidateRejectsWrongAction', 0, () => {
      const upload: DownloadConfig = new DownloadConfig('UPLOAD', URL_TASK_A, true, 'GET', './');
      const download: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const errors: string[] = upload.validate();
      logStep('FingerprintRegression', 'action errors ' + errors.join(','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('action-not-download');
      expect(upload.isValid()).assertFalse();
      expect(download.isValid()).assertTrue();
      expect(download.action).assertEqual('DOWNLOAD');
      expect(upload.url).assertEqual(download.url);
      expect(errors.indexOf('url-not-https')).assertEqual(-1);
    });

    /**
     * @tc.name   fingerprintRegressionConfigValidateRejectsWrongSaveas
     * @tc.desc   The save path must remain the relative cache token, so an absolute path is a single defect.
     * @tc.precondition  The shared driver is loaded and the URL and action are valid.
     * @tc.steps         1. Build a config whose saveas is an absolute directory.
     *                   2. Read the validation list.
     *                   3. Compare the saveas with the page literal.
     * @tc.expected      Only saveas-not-cache is reported and the token differs from the literal.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionConfigValidateRejectsWrongSaveas', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'GET', '/data/storage');
      const errors: string[] = config.validate();
      logStep('FingerprintRegression', 'saveas errors ' + errors.join(','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('saveas-not-cache');
      expect(config.isValid()).assertFalse();
      expect(config.saveas === CONFIG_SAVEAS_CACHE).assertFalse();
      expect(config.saveas.startsWith('/')).assertTrue();
      expect(DownloadConfig.forTask(TASK_B).saveas).assertEqual('./');
      expect(errors.indexOf('action-not-download')).assertEqual(-1);
    });

    /**
     * @tc.name   fingerprintRegressionConfigValidateRejectsWrongMethod
     * @tc.desc   Only GET and POST are accepted; an unsupported verb is reported while POST stays valid.
     * @tc.precondition  The shared driver is loaded and the URL, action and saveas are valid.
     * @tc.steps         1. Build a config with the PUT method.
     *                   2. Build a config with the POST method.
     *                   3. Compare both validation results.
     * @tc.expected      PUT reports method-unsupported while POST validates cleanly.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionConfigValidateRejectsWrongMethod', 0, () => {
      const put: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'PUT', './');
      const post: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'POST', './');
      const errors: string[] = put.validate();
      logStep('FingerprintRegression', 'method errors ' + errors.join(','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('method-unsupported');
      expect(put.isValid()).assertFalse();
      expect(post.validate().length).assertEqual(0);
      expect(post.isValid()).assertTrue();
      expect(post.describe().indexOf('POST')).assertLarger(0);
      expect(put.method === CONFIG_METHOD_GET).assertFalse();
    });

    /**
     * @tc.name   fingerprintRegressionConfigValidateRejectsOverwriteOff
     * @tc.desc   The page always overwrites, so a config with overwrite disabled reports exactly one defect.
     * @tc.precondition  The shared driver is loaded and every other field uses the page literal.
     * @tc.steps         1. Build a valid URL config with overwrite set to false.
     *                   2. Read the validation list.
     *                   3. Compare with the overwrite true config.
     * @tc.expected      Only overwrite-disabled is reported and the true config is valid.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionConfigValidateRejectsOverwriteOff', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, false, 'GET', './');
      const errors: string[] = config.validate();
      logStep('FingerprintRegression', 'overwrite errors ' + errors.join(','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('overwrite-disabled');
      expect(config.overwrite).assertFalse();
      expect(config.isValid()).assertFalse();
      expect(DownloadConfig.forTask(TASK_A).overwrite).assertTrue();
      expect(DownloadConfig.forTask(TASK_A).isValid()).assertTrue();
      expect(errors.indexOf('url-empty')).assertEqual(-1);
    });

    /**
     * @tc.name   fingerprintRegressionConfigDescribeFormat
     * @tc.desc   The description is a five field pipe joined string in action, method, overwrite, saveas, URL order.
     * @tc.precondition  The shared driver is loaded and the config for task C is valid.
     * @tc.steps         1. Describe the valid task C config.
     *                   2. Split the description on the pipe separator.
     *                   3. Compare each field with the config member.
     * @tc.expected      The description has five segments matching the five fields.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionConfigDescribeFormat', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const described: string = config.describe();
      const parts: string[] = described.split('|');
      logStep('FingerprintRegression', 'describe segments ' + String(parts.length));
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual(config.action);
      expect(parts[1]).assertEqual(config.method);
      expect(parts[2]).assertEqual(String(config.overwrite));
      expect(parts[3]).assertEqual(config.saveas);
      expect(parts[4]).assertEqual(config.url);
      expect(described.indexOf('|')).assertLarger(0);
      expect(described.endsWith('.png')).assertTrue();
    });

    /**
     * @tc.name   fingerprintRegressionResourceExpectationForAllTasks
     * @tc.desc   The resource expectation helper freezes file name, extension and host for every task.
     * @tc.precondition  The shared driver is loaded and expectationFor is available for all task numbers.
     * @tc.steps         1. Build expectations for A, B and C.
     *                   2. Read the derived file name, extension and host.
     *                   3. Compare each field with the frozen literals.
     * @tc.expected      Every expectation carries the right tail, a .png extension and the gitee host.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionResourceExpectationForAllTasks', 0, () => {
      const a: UrlExpectation = expectationFor(TASK_A);
      const b: UrlExpectation = expectationFor(TASK_B);
      const c: UrlExpectation = expectationFor(TASK_C);
      logStep('FingerprintRegression', 'expectations ' + a.fileName + ' ' + b.fileName + ' ' + c.fileName);
      expect(a.taskNo).assertEqual(TASK_A);
      expect(a.fileName).assertEqual('favor_list_tea.png');
      expect(b.fileName).assertEqual('after_cache.png');
      expect(c.fileName).assertEqual('icon_main_color.png');
      expect(a.extension).assertEqual('.png');
      expect(b.extension).assertEqual(c.extension);
      expect(c.host).assertEqual('gitee.com');
    });

    /**
     * @tc.name   fingerprintRegressionResourceFileNameMatchesUrl
     * @tc.desc   The expectation file name is exactly the last path segment of its URL, including the query free tail.
     * @tc.precondition  The shared driver is loaded and fileNameOf is exported.
     * @tc.steps         1. Build the expectation for task B.
     *                   2. Derive the file name from the URL directly.
     *                   3. Compare the two and check the suffix.
     * @tc.expected      Both names are after_cache.png and the URL ends with the name.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionResourceFileNameMatchesUrl', 0, () => {
      const expectation: UrlExpectation = expectationFor(TASK_B);
      const derived: string = fileNameOf(expectation.url);
      logStep('FingerprintRegression', 'derived name ' + derived);
      expect(derived).assertEqual(expectation.fileName);
      expect(derived).assertEqual('after_cache.png');
      expect(expectation.url.endsWith(derived)).assertTrue();
      expect(expectation.url.indexOf(derived)).assertLarger(0);
      expect(derived.indexOf('.')).assertLarger(0);
      expect(derived === '').assertFalse();
    });

    /**
     * @tc.name   fingerprintRegressionResourceExtensionPng
     * @tc.desc   Every frozen resource carries the same four character .png extension with a leading dot.
     * @tc.precondition  The shared driver is loaded and extensionOf returns the dotted suffix.
     * @tc.steps         1. Derive the extension for all three URL literals.
     *                   2. Compare the three extensions.
     *                   3. Check the length and the leading dot.
     * @tc.expected      All three extensions are .png with length four.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionResourceExtensionPng', 0, () => {
      const urls: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      const extensions: string[] = [];
      for (let index: int = 0; index < urls.length; index++) {
        extensions.push(extensionOf(urls[index]));
      }
      logStep('FingerprintRegression', 'extensions ' + extensions.join(','));
      expect(extensions.length).assertEqual(3);
      expect(extensions[0]).assertEqual('.png');
      expect(extensions[1]).assertEqual(extensions[0]);
      expect(extensions[2]).assertEqual(extensions[0]);
      expect(extensions[0].length).assertEqual(4);
      expect(extensions[0].startsWith('.')).assertTrue();
      expect(extensionOf('https://example.com/no-extension')).assertEqual('');
    });

    /**
     * @tc.name   fingerprintRegressionUrlFingerprintStable
     * @tc.desc   Each frozen URL hashes to a stable non-zero value and the three URLs hash to different values.
     * @tc.precondition  The shared driver is loaded and textFingerprint is deterministic.
     * @tc.steps         1. Hash each of the three URL literals.
     *                   2. Hash the first URL a second time.
     *                   3. Compare the hashes for equality and difference.
     * @tc.expected      The repeat hash matches while the three distinct URLs differ.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionUrlFingerprintStable', 0, () => {
      const hashA: number = textFingerprint(URL_TASK_A);
      const hashB: number = textFingerprint(URL_TASK_B);
      const hashC: number = textFingerprint(URL_TASK_C);
      const repeat: number = textFingerprint(URL_TASK_A);
      logStep('FingerprintRegression', 'url hashes ' + String(hashA) + '/' + String(hashB) + '/' + String(hashC));
      expect(repeat).assertEqual(hashA);
      expect(hashA === hashB).assertFalse();
      expect(hashB === hashC).assertFalse();
      expect(hashA === hashC).assertFalse();
      expect(hashA).assertLarger(0);
      expect(hashA).assertLess(1000003);
      expect(URL_TASK_A === URL_TASK_B).assertFalse();
    });

    /**
     * @tc.name   fingerprintRegressionTextFingerprintEmptySeed
     * @tc.desc   The empty string hashes to the seed constant, which is the baseline of every recorder fingerprint.
     * @tc.precondition  The shared driver is loaded and the hash seed is part of the helper contract.
     * @tc.steps         1. Hash the empty string.
     *                   2. Hash a single character and compare.
     *                   3. Hash the empty string again.
     * @tc.expected      The empty hash is 216613 and any content changes it.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionTextFingerprintEmptySeed', 0, () => {
      const empty: number = textFingerprint('');
      const single: number = textFingerprint('a');
      const repeat: number = textFingerprint('');
      logStep('FingerprintRegression', 'empty seed ' + String(empty));
      expect(empty).assertEqual(216613);
      expect(repeat).assertEqual(empty);
      expect(single === empty).assertFalse();
      expect(single).assertLarger(0);
      expect(textFingerprint(' ')).assertLarger(0);
      expect(textFingerprint('\n')).assertEqual(textFingerprint('\n'));
    });

    /**
     * @tc.name   fingerprintRegressionTextFingerprintSensitiveToOrder
     * @tc.desc   Swapping two characters changes the hash, so a reordered trace cannot alias the original.
     * @tc.precondition  The shared driver is loaded and the hash consumes characters left to right.
     * @tc.steps         1. Hash AB and BA.
     *                   2. Hash two copies of ABC.
     *                   3. Compare all three results.
     * @tc.expected      The reordered strings differ while the repeated string matches.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionTextFingerprintSensitiveToOrder', 0, () => {
      const forward: number = textFingerprint('AB');
      const backward: number = textFingerprint('BA');
      const first: number = textFingerprint('ABC');
      const second: number = textFingerprint('ABC');
      logStep('FingerprintRegression', 'order hashes ' + String(forward) + '/' + String(backward));
      expect(forward === backward).assertFalse();
      expect(first).assertEqual(second);
      expect(forward === first).assertFalse();
      expect(textFingerprint('A|B')).assertEqual(textFingerprint('A|B'));
      expect(textFingerprint('A|B') === textFingerprint('B|A')).assertFalse();
      expect(forward).assertLarger(0);
    });

    /**
     * @tc.name   fingerprintRegressionTextFingerprintDeterministic
     * @tc.desc   Hashing the same trace twenty times returns one value, so a regression cannot depend on call order.
     * @tc.precondition  The shared driver is loaded and the hash keeps no mutable state between calls.
     * @tc.steps         1. Hash a fixed trace once and store the value.
     *                   2. Hash the same trace twenty more times.
     *                   3. Count any value that differs from the stored one.
     * @tc.expected      The mismatch counter stays zero and the hash is non-zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionTextFingerprintDeterministic', 0, () => {
      const trace: string = 'A/completed/100|B/running/40|C/idle/0';
      const baseline: number = textFingerprint(trace);
      let mismatches: number = 0;
      for (let round: number = 0; round < 20; round++) {
        if (textFingerprint(trace) !== baseline) {
          mismatches = mismatches + 1;
        }
      }
      logStep('FingerprintRegression', 'determinism mismatches ' + String(mismatches));
      expect(mismatches).assertEqual(0);
      expect(baseline).assertLarger(0);
      expect(baseline).assertLess(1000003);
      expect(baseline).assertEqual(textFingerprint(trace));
      expect(textFingerprint(trace + '|')).assertEqual(textFingerprint(trace + '|'));
      expect(textFingerprint(trace) === textFingerprint(trace + '|')).assertFalse();
    });

    /**
     * @tc.name   fingerprintRegressionMetricsFingerprintFreshGraph
     * @tc.desc   The metrics fingerprint of a fresh graph is the hash of the four zero count fields.
     * @tc.precondition  The shared driver is loaded and a fresh graph has three untouched rows.
     * @tc.steps         1. Build the metrics from a fresh graph.
     *                   2. Hash the literal count string by hand.
     *                   3. Compare the two fingerprints.
     * @tc.expected      Both fingerprints equal the hash of 3:0:0:0.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionMetricsFingerprintFreshGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      const expected: number = textFingerprint('3:0:0:0');
      logStep('FingerprintRegression', 'fresh metrics print ' + String(metrics.fingerprint()));
      expect(metrics.fingerprint()).assertEqual(expected);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(0);
      expect(metrics.fingerprint()).assertLarger(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('3:0:0:0'));
    });

    /**
     * @tc.name   fingerprintRegressionMetricsFingerprintAfterCompletion
     * @tc.desc   Completing one row moves the metrics fingerprint to the hash of 3:1:0:100 and away from fresh.
     * @tc.precondition  The shared driver is loaded and graph row A is the only completed row.
     * @tc.steps         1. Read the fresh metrics fingerprint.
     *                   2. Start the graph and complete row A.
     *                   3. Compare the new fingerprint with the hand hash and the fresh one.
     * @tc.expected      The new fingerprint equals the hash of 3:1:0:100 and differs from fresh.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionMetricsFingerprintAfterCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const fresh: number = NetworkMetrics.from(graph).fingerprint();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      const after: number = metrics.fingerprint();
      logStep('FingerprintRegression', 'metrics after completion ' + String(after));
      expect(after).assertEqual(textFingerprint('3:1:0:100'));
      expect(after === fresh).assertFalse();
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.totalProgress).assertEqual(100);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.averageProgress()).assertEqual(100.0 / 3);
      expect(fresh).assertEqual(textFingerprint('3:0:0:0'));
    });

    /**
     * @tc.name   fingerprintRegressionMetricsRepeatedRunsSameFingerprint
     * @tc.desc   Two equivalent partial runs produce identical metrics fingerprints, even with different stamp values.
     * @tc.precondition  The shared driver is loaded and both graphs complete A and report 40 on B.
     * @tc.steps         1. Apply the same operations with different timestamps.
     *                   2. Build both metrics views.
     *                   3. Compare the fingerprints and the underlying totals.
     * @tc.expected      The fingerprints match and both totals are 140.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionMetricsRepeatedRunsSameFingerprint', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 10);
      second.completeTask(TASK_A, 900);
      first.taskAt(1).reportProgress(40);
      second.taskAt(1).reportProgress(40);
      const firstMetrics: NetworkMetrics = NetworkMetrics.from(first);
      const secondMetrics: NetworkMetrics = NetworkMetrics.from(second);
      logStep('FingerprintRegression', 'repeated metrics ' + String(firstMetrics.fingerprint()));
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.totalProgress).assertEqual(140);
      expect(secondMetrics.totalProgress).assertEqual(140);
      expect(firstMetrics.successRatio()).assertEqual(secondMetrics.successRatio());
      expect(firstMetrics.averageProgress()).assertEqual(secondMetrics.averageProgress());
      expect(firstMetrics.fingerprint()).assertEqual(textFingerprint('3:1:0:140'));
      expect(first.taskAt(0).finishedAt === second.taskAt(0).finishedAt).assertFalse();
    });

    /**
     * @tc.name   fingerprintRegressionSnapshotSameAsAfterRerun
     * @tc.desc   Snapshot equality ignores timestamps, so a rerun that ends in the same triple compares equal.
     * @tc.precondition  The shared driver is loaded and row A is run to completion twice with different stamps.
     * @tc.steps         1. Complete the first run and capture the snapshot.
     *                   2. Reset, run again and capture the second snapshot.
     *                   3. Compare the snapshots and the finish stamps.
     * @tc.expected      The snapshots compare equal while the finish stamps differ.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionSnapshotSameAsAfterRerun', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.complete(100);
      const first: RunSnapshot = task.snapshot();
      const firstStamp: number = task.finishedAt;
      task.reset();
      task.start(200);
      task.complete(300);
      const second: RunSnapshot = task.snapshot();
      logStep('FingerprintRegression', 'rerun snapshots ' + first.describe() + ' / ' + second.describe());
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(first)).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
      expect(firstStamp).assertEqual(100);
      expect(task.finishedAt).assertEqual(300);
      expect(firstStamp === task.finishedAt).assertFalse();
      expect(task.attempts).assertEqual(2);
    });

    /**
     * @tc.name   fingerprintRegressionResetProducesFreshTrace
     * @tc.desc   After a graph reset a new capture reproduces the exact fresh trace of the first run.
     * @tc.precondition  The shared driver is loaded and the graph has completed a full run.
     * @tc.steps         1. Capture the fresh graph and the completed graph.
     *                   2. Reset the graph and capture again.
     *                   3. Compare the first and third traces.
     * @tc.expected      The post-reset trace equals the fresh trace and differs from the completed one.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionResetProducesFreshTrace', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const freshLog: SnapshotLog = new SnapshotLog();
      freshLog.capture(graph.tasks);
      const freshTrace: string = freshLog.trace();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.completeTask(TASK_C, 30);
      const completedLog: SnapshotLog = new SnapshotLog();
      completedLog.capture(graph.tasks);
      const completedTrace: string = completedLog.trace();
      graph.reset();
      const resetLog: SnapshotLog = new SnapshotLog();
      resetLog.capture(graph.tasks);
      logStep('FingerprintRegression', 'reset trace ' + resetLog.trace());
      expect(freshTrace).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(resetLog.trace()).assertEqual(freshTrace);
      expect(completedTrace === freshTrace).assertFalse();
      expect(completedTrace).assertEqual('A/completed/100|B/completed/100|C/completed/100');
      expect(textFingerprint(resetLog.trace())).assertEqual(textFingerprint(freshTrace));
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   fingerprintRegressionDescribeTripleStable
     * @tc.desc   Repeated describe calls of an unchanged row are identical and a progress report changes the last field.
     * @tc.precondition  The shared driver is loaded and row B is running at 25 percent.
     * @tc.steps         1. Describe row B twice and compare.
     *                   2. Report 75 percent and describe again.
     *                   3. Split the three descriptions.
     * @tc.expected      The two first descriptions match and the third reports 75 in the last field.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionDescribeTripleStable', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.reportProgress(25);
      const first: string = task.describe();
      const second: string = task.describe();
      task.reportProgress(75);
      const third: string = task.describe();
      logStep('FingerprintRegression', 'describe series ' + first + ' / ' + third);
      expect(first).assertEqual(second);
      expect(first).assertEqual('B:running:25');
      expect(third).assertEqual('B:running:75');
      expect(third === first).assertFalse();
      expect(third.split(':').length).assertEqual(3);
      expect(third.split(':')[2]).assertEqual('75');
      expect(third.split(':')[1]).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   fingerprintRegressionEventTraceFingerprintStable
     * @tc.desc   Two full runs produce identical event traces, and their fingerprint equals the hash of that trace.
     * @tc.precondition  The shared driver is loaded and both graphs start from an empty recorder.
     * @tc.steps         1. Drive both graphs through the full gate sequence.
     *                   2. Compare the two traces and the two fingerprints.
     *                   3. Hash the first trace by hand.
     * @tc.expected      The traces and fingerprints match and the manual hash agrees.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionEventTraceFingerprintStable', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 10);
      second.completeTask(TASK_A, 10);
      first.completeTask(TASK_B, 20);
      second.completeTask(TASK_B, 20);
      first.pollTick(30);
      second.pollTick(30);
      first.completeTaskC(40);
      second.completeTaskC(40);
      const trace: string = first.eventTrace();
      logStep('FingerprintRegression', 'event trace fingerprint ' + String(first.events.fingerprint()));
      expect(trace).assertEqual(second.eventTrace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.fingerprint()).assertEqual(textFingerprint(trace));
      expect(trace.split('|').length).assertEqual(11);
      expect(first.events.countOf('completed')).assertEqual(3);
      expect(trace === second.eventTrace()).assertTrue();
      expect(first.events.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name   fingerprintRegressionCompletionTraceString
     * @tc.desc   The completion trace of a gated run is A|B|C and only gate respecting orders pass the check.
     * @tc.precondition  The shared driver is loaded and the graph runs through the gate to completion.
     * @tc.steps         1. Run the graph through the gate and read the trace.
     *                   2. Split the trace and validate the order.
     *                   3. Validate an invalid order literal.
     * @tc.expected      The trace is A|B|C with three segments and the invalid order is rejected.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionCompletionTraceString', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.completeTaskC(40);
      const trace: string = completionTrace(graph);
      const invalid: string[] = [TASK_C, TASK_A, TASK_B];
      logStep('FingerprintRegression', 'completion ' + trace);
      expect(trace).assertEqual('A|B|C');
      expect(trace.split('|').length).assertEqual(3);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(isTopologicalCompletion(invalid)).assertFalse();
      expect(graph.completionOrder[1]).assertEqual(TASK_B);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(textFingerprint(trace)).assertEqual(textFingerprint('A|B|C'));
    });

    /**
     * @tc.name   fingerprintRegressionConfigSameAsAcrossCalls
     * @tc.desc   sameAs is true for two calls of the same task factory and false across neighbouring tasks.
     * @tc.precondition  The shared driver is loaded and the factory is deterministic.
     * @tc.steps         1. Build forTask B twice and compare with sameAs.
     *                   2. Build forTask A and compare it with B.
     *                   3. Compare the description strings.
     * @tc.expected      B matches B, B does not match A and the descriptions follow the decision.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintRegressionConfigSameAsAcrossCalls', 0, () => {
      const first: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const second: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const neighbour: DownloadConfig = DownloadConfig.forTask(TASK_A);
      logStep('FingerprintRegression', 'sameAs B/B ' + String(first.sameAs(second)));
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(first)).assertTrue();
      expect(first.sameAs(neighbour)).assertFalse();
      expect(first.describe()).assertEqual(second.describe());
      expect(first.describe() === neighbour.describe()).assertFalse();
      expect(first.url).assertEqual(second.url);
      expect(neighbour.url).assertEqual(URL_TASK_A);
    });

    /**
     * @tc.name   fingerprintRegressionSnapshotLatestPerTask
     * @tc.desc   latest answers the newest triple for each task independently after an interleaved capture.
     * @tc.precondition  The shared driver is loaded and two capture rounds bracket a single progress report.
     * @tc.steps         1. Capture the fresh graph.
     *                   2. Report 30 percent on row A and capture again.
     *                   3. Ask latest for A, B and C.
     * @tc.expected      A answers 30 while B and C still answer the original zero triple.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionSnapshotLatestPerTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.taskAt(0).reportProgress(30);
      log.capture(graph.tasks);
      const latestA: RunSnapshot = log.latest(TASK_A) as RunSnapshot;
      const latestB: RunSnapshot = log.latest(TASK_B) as RunSnapshot;
      const latestC: RunSnapshot = log.latest(TASK_C) as RunSnapshot;
      logStep('FingerprintRegression', 'latest triples ' + latestA.describe() + ' / ' + latestC.describe());
      expect(log.size()).assertEqual(6);
      expect(latestA.progress).assertEqual(30);
      expect(latestB.progress).assertEqual(0);
      expect(latestC.progress).assertEqual(0);
      expect(latestA.describe()).assertEqual('A/idle/30');
      expect(latestB.describe()).assertEqual('B/idle/0');
      expect(latestC.status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   fingerprintRegressionSnapshotClearThenRecapture
     * @tc.desc   Clearing a snapshot log and capturing the same graph again restores the fresh trace exactly.
     * @tc.precondition  The shared driver is loaded and the log has already accumulated two rounds.
     * @tc.steps         1. Capture the graph twice and read the size.
     *                   2. Clear the log and confirm latest is undefined.
     *                   3. Capture once more and compare the trace.
     * @tc.expected      The cleared size is zero and the recaptured trace equals the fresh trace.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintRegressionSnapshotClearThenRecapture', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      log.capture(graph.tasks);
      const before: number = log.size();
      log.clear();
      const clearedLatest: RunSnapshot | undefined = log.latest(TASK_A);
      log.capture(graph.tasks);
      logStep('FingerprintRegression', 'recaptured ' + log.trace());
      expect(before).assertEqual(6);
      expect(clearedLatest === undefined).assertTrue();
      expect(log.size()).assertEqual(3);
      expect(log.trace()).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      expect(textFingerprint(log.trace())).assertEqual(textFingerprint('A/idle/0|B/idle/0|C/idle/0'));
      expect(log.size()).assertLess(before);
    });

    /**
     * @tc.name   fingerprintRegressionFullRegressionCycleTrace
     * @tc.desc   Two identical lifecycle scripts produce the same describe trace and the same trace fingerprint.
     * @tc.precondition  The shared driver is loaded and each cycle builds its own row.
     * @tc.steps         1. Run start, progress, complete on two fresh rows and collect the descriptions.
     *                   2. Join each cycle with a separator.
     *                   3. Compare the two traces and their hashes.
     * @tc.expected      The traces are identical and the hashes match.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintRegressionFullRegressionCycleTrace', 0, () => {
      const firstParts: string[] = [];
      const secondParts: string[] = [];
      const first: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      const second: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      firstParts.push(first.describe());
      secondParts.push(second.describe());
      first.start(0);
      second.start(0);
      firstParts.push(first.describe());
      secondParts.push(second.describe());
      first.reportProgress(60);
      second.reportProgress(60);
      firstParts.push(first.describe());
      secondParts.push(second.describe());
      first.complete(500);
      second.complete(500);
      firstParts.push(first.describe());
      secondParts.push(second.describe());
      const firstTrace: string = firstParts.join('>');
      const secondTrace: string = secondParts.join('>');
      logStep('FingerprintRegression', 'cycle trace ' + firstTrace);
      expect(firstTrace).assertEqual(secondTrace);
      expect(textFingerprint(firstTrace)).assertEqual(textFingerprint(secondTrace));
      expect(firstTrace).assertEqual('C:idle:0>C:running:0>C:running:60>C:completed:100');
      expect(firstParts.length).assertEqual(4);
      expect(first.attempts).assertEqual(second.attempts);
      expect(first.progress).assertEqual(PROGRESS_TOTAL);
      expect(textFingerprint(firstTrace)).assertLarger(0);
    });

    /**
     * @tc.name   fingerprintRegressionRunSnapshotEqualityMatrix
     * @tc.desc   Row by row snapshots of two equivalent graphs compare equal, and a drift on one row breaks only that row.
     * @tc.precondition  The shared driver is loaded and both graphs hold the same three progress values.
     * @tc.steps         1. Report 10, 20 and 30 percent on both graphs.
     *                   2. Capture both and compare matching rows.
     *                   3. Report 31 on the second graph and compare again.
     * @tc.expected      The three initial rows match and only row C breaks after the drift.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintRegressionRunSnapshotEqualityMatrix', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.taskAt(0).reportProgress(10);
      second.taskAt(0).reportProgress(10);
      first.taskAt(1).reportProgress(20);
      second.taskAt(1).reportProgress(20);
      first.taskAt(2).reportProgress(30);
      second.taskAt(2).reportProgress(30);
      const firstSnapshots: RunSnapshot[] = [];
      const secondSnapshots: RunSnapshot[] = [];
      for (let index: int = 0; index < 3; index++) {
        firstSnapshots.push(first.taskAt(index).snapshot());
        secondSnapshots.push(second.taskAt(index).snapshot());
      }
      second.taskAt(2).reportProgress(31);
      let equalRows: number = 0;
      for (let index: int = 0; index < 3; index++) {
        if (firstSnapshots[index].sameAs(secondSnapshots[index])) {
          equalRows = equalRows + 1;
        }
      }
      logStep('FingerprintRegression', 'equal rows before drift ' + String(equalRows));
      expect(equalRows).assertEqual(3);
      expect(firstSnapshots[2].sameAs(second.taskAt(2).snapshot())).assertFalse();
      expect(firstSnapshots[0].sameAs(second.taskAt(0).snapshot())).assertTrue();
      expect(firstSnapshots[1].sameAs(second.taskAt(1).snapshot())).assertTrue();
      expect(second.taskAt(2).progress).assertEqual(31);
      expect(textFingerprint(first.snapshotText()) === textFingerprint(second.snapshotText())).assertFalse();
    });

    /**
     * @tc.name   fingerprintRegressionConfigRoundTripDescribeSplit
     * @tc.desc   A config rebuilt from the five segments of its description compares equal to the original.
     * @tc.precondition  The shared driver is loaded and the task A config is valid.
     * @tc.steps         1. Describe the task A config and split it into five parts.
     *                   2. Rebuild a config from the parsed fields.
     *                   3. Compare the rebuilt config with the original.
     * @tc.expected      The rebuilt config validates cleanly and compares equal to the original.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintRegressionConfigRoundTripDescribeSplit', 0, () => {
      const original: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const parts: string[] = original.describe().split('|');
      const rebuilt: DownloadConfig = new DownloadConfig(parts[0], parts[4], parts[2] === 'true', parts[1], parts[3]);
      logStep('FingerprintRegression', 'rebuilt ' + rebuilt.describe());
      expect(parts.length).assertEqual(5);
      expect(rebuilt.describe()).assertEqual(original.describe());
      expect(rebuilt.sameAs(original)).assertTrue();
      expect(rebuilt.isValid()).assertTrue();
      expect(textFingerprint(rebuilt.describe())).assertEqual(textFingerprint(original.describe()));
      expect(rebuilt.overwrite).assertTrue();
      expect(rebuilt.url).assertEqual(URL_TASK_A);
    });
  });
}
