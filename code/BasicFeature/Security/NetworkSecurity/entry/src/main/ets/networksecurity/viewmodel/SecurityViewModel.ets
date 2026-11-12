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

import { common } from '@kit.AbilityKit';
import { CertFileItem, CertFileService, CertMeta, CertVerifyResult, CertVerifyService, CleartextResult,
  CleartextService, EnvironmentCheck, EnvironmentService, HttpProbeResult, HttpProbeService, LogEntry, Logger,
  appendLog, createEmptyCertMeta, createEmptyVerifyResult, nowTimeText } from 'library';

// Maximum number of log entries kept in the log panel.
const LOG_LIMIT: number = 50;
// Maximum number of HTTP probe results kept in the list.
const PROBE_LIMIT: number = 4;
// Default host name used by the cleartext input.
const DEFAULT_HOST: string = 'www.example.com';
// Host name used by the certificate chain verification demo.
const CHAIN_HOST: string = 'netsecurity.sample.com';
// Index of the bundled CA certificate in the file list.
const CA_INDEX: number = 0;
// Index of the bundled server certificate in the file list.
const SERVER_INDEX: number = 1;
// Certificate preselected when the page binds.
const DEFAULT_SELECTED_INDEX: number = 1;
// Sentinel for an empty collection or string.
const EMPTY_LENGTH: number = 0;

/**
 * State holder for the security verification page.
 */
@ObservedV2
export class SecurityViewModel {
  // Latest environment check results.
  @Trace public checks: EnvironmentCheck[] = [];
  // Built-in certificate file descriptors loaded from rawfile.
  @Trace public certFiles: CertFileItem[] = [];
  // Index of the certificate selected on the page.
  @Trace public selectedIndex: number = DEFAULT_SELECTED_INDEX;
  // Parsed metadata of the selected certificate.
  @Trace public meta: CertMeta = createEmptyCertMeta();
  // Whether the certificate metadata finished parsing.
  @Trace public metaLoaded: boolean = false;
  // Latest certificate verification result.
  @Trace public lastResult: CertVerifyResult = createEmptyVerifyResult();
  // Latest cleartext policy query result.
  @Trace public cleartext: CleartextResult = new CleartextResult(false, '', false);
  // Host name typed into the cleartext input.
  @Trace public hostInput: string = DEFAULT_HOST;
  // Recent HTTP probe results, newest first.
  @Trace public probeResults: HttpProbeResult[] = [];
  // Log entries shown in the shared log panel.
  @Trace public logs: LogEntry[] = [];
  // Whether an async demo action is running.
  @Trace public busy: boolean = false;

  // Ability context bound by the page, null before bind().
  private context: common.Context | null = null;
  // Monotonic sequence for log entry ids.
  private logSeq: number = 0;

  /**
   * Bind the ability context and run the initial load of certificates and checks.
   * @param context ability context used to read the bundled certificate files.
   */
  bind(context: common.Context): void {
    Logger.enter('[SecurityViewModel#bind]');
    Logger.beginTrace('NetworkSecurity.entry.bind', 1);
    // Keep the context for later certificate file reads.
    this.context = context;
    // Load the built-in certificate descriptors from rawfile.
    this.certFiles = CertFileService.load(context);
    // Report the loaded certificate count in the log panel.
    this.log('info', 'CertFile', 'Loaded ' + this.certFiles.length.toString() + ' built-in certificates');
    // Run the first environment sweep.
    this.refreshEnvironment();
    // Preselect the default server certificate.
    this.selectCert(DEFAULT_SELECTED_INDEX);
    Logger.endTrace('NetworkSecurity.entry.bind', 1);
    Logger.exit('[SecurityViewModel#bind]');
  }

  /**
   * Re-run the environment checks and count the passed items.
   */
  async refreshEnvironment(): Promise<void> {
    Logger.enter('[SecurityViewModel#refreshEnvironment]');
    Logger.beginTrace('NetworkSecurity.entry.refreshEnvironment', 1);
    // Run the environment check service asynchronously.
    this.checks = await EnvironmentService.check();
    // Count the checks that passed.
    let passed: number = 0;
    for (let index = 0; index < this.checks.length; index++) {
      if (this.checks[index].passed) {
        passed += 1;
      }
    }
    // Report the pass ratio in the log panel.
    this.log('info', 'Environment', 'Check finished, ' + passed.toString() + '/' + this.checks.length.toString() +
      ' passed');
    Logger.endTrace('NetworkSecurity.entry.refreshEnvironment', 1);
    Logger.exit('[SecurityViewModel#refreshEnvironment]');
  }

  /**
   * Select one certificate by index and load its parsed metadata.
   * @param index index of the certificate in the loaded file list.
   */
  async selectCert(index: number): Promise<void> {
    Logger.enter('[SecurityViewModel#selectCert]', 'index: ' + index.toString());
    Logger.beginTrace('NetworkSecurity.entry.selectCert', 1);
    // Ignore indexes outside the loaded file list.
    if (index < 0 || index >= this.certFiles.length) {
      Logger.endTrace('NetworkSecurity.entry.selectCert', 1);
      Logger.exit('[SecurityViewModel#selectCert]', 'skipped: index out of range');
      return;
    }
    // Remember the selection and clear the stale metadata first.
    this.selectedIndex = index;
    this.meta = createEmptyCertMeta();
    this.metaLoaded = false;
    // Parsing needs the bound ability context.
    if (this.context === null) {
      Logger.endTrace('NetworkSecurity.entry.selectCert', 1);
      Logger.exit('[SecurityViewModel#selectCert]', 'skipped: context not bound');
      return;
    }
    // Read and parse the certificate metadata asynchronously.
    const item: CertFileItem = this.certFiles[index];
    const meta: CertMeta | undefined = await CertFileService.readMeta(this.context, item.path);
    // A missing parse result is reported as a warning and leaves the meta empty.
    if (meta === undefined) {
      this.log('warn', 'CertMeta', 'Failed to parse ' + item.fileName);
      Logger.endTrace('NetworkSecurity.entry.selectCert', 1);
      Logger.exit('[SecurityViewModel#selectCert]', 'failed to parse ' + item.fileName);
      return;
    }
    // Publish the parsed metadata to the page.
    this.meta = meta;
    this.metaLoaded = true;
    this.log('info', 'CertMeta', 'Parsed ' + item.fileName);
    Logger.endTrace('NetworkSecurity.entry.selectCert', 1);
    Logger.exit('[SecurityViewModel#selectCert]', 'parsed ' + item.fileName);
  }

  /**
   * Verify the selected certificate against the CA with the synchronous API.
   */
  verifySync(): void {
    Logger.enter('[SecurityViewModel#verifySync]');
    Logger.beginTrace('NetworkSecurity.entry.verifySync', 1);
    // Skip when the context is not bound or no certificate is loaded.
    if (this.context === null || this.certFiles.length === EMPTY_LENGTH) {
      Logger.endTrace('NetworkSecurity.entry.verifySync', 1);
      Logger.exit('[SecurityViewModel#verifySync]', 'skipped: unbound or no certificate');
      return;
    }
    // Read the selected certificate PEM text synchronously.
    const item: CertFileItem = this.certFiles[this.selectedIndex];
    const pem: string = this.selectedPem();
    // An unreadable file is reported as a warning.
    if (pem.length === EMPTY_LENGTH) {
      this.log('warn', 'CertSync', 'Cannot read ' + item.fileName);
      Logger.endTrace('NetworkSecurity.entry.verifySync', 1);
      Logger.exit('[SecurityViewModel#verifySync]', 'skipped: cannot read ' + item.fileName);
      return;
    }
    // Run the synchronous verification against the CA certificate.
    const result: CertVerifyResult = CertVerifyService.verifySync(pem, this.caPem());
    this.recordResult('CertSync', result, item.fileName);
    Logger.endTrace('NetworkSecurity.entry.verifySync', 1);
    Logger.exit('[SecurityViewModel#verifySync]');
  }

  /**
   * Verify the selected certificate against the CA with the asynchronous API.
   */
  async verifyAsync(): Promise<void> {
    Logger.enter('[SecurityViewModel#verifyAsync]');
    Logger.beginTrace('NetworkSecurity.entry.verifyAsync', 1);
    // Skip when a verification is already running or the context is not bound.
    if (this.busy || this.context === null || this.certFiles.length === EMPTY_LENGTH) {
      Logger.endTrace('NetworkSecurity.entry.verifyAsync', 1);
      Logger.exit('[SecurityViewModel#verifyAsync]', 'skipped: busy or unbound');
      return;
    }
    this.busy = true;
    try {
      // Read the selected certificate PEM text.
      const item: CertFileItem = this.certFiles[this.selectedIndex];
      const pem: string = this.selectedPem();
      // An unreadable file is reported as a warning.
      if (pem.length === EMPTY_LENGTH) {
        this.log('warn', 'CertAsync', 'Cannot read ' + item.fileName);
        return;
      }
      // Run the asynchronous verification against the CA certificate.
      const result: CertVerifyResult = await CertVerifyService.verifyAsync(pem, this.caPem());
      this.recordResult('CertAsync', result, item.fileName);
    } finally {
      // Release the busy flag and close the trace section on every path.
      this.busy = false;
      Logger.endTrace('NetworkSecurity.entry.verifyAsync', 1);
      Logger.exit('[SecurityViewModel#verifyAsync]');
    }
  }

  /**
   * Verifies the server certificate chain against the bundled root CA and the sample host name.
   */
  async verifyChain(): Promise<void> {
    Logger.enter('[SecurityViewModel#verifyChain]');
    Logger.beginTrace('NetworkSecurity.entry.verifyChain', 1);
    // Skip when a verification is already running or the context is not bound.
    if (this.busy || this.context === null || this.certFiles.length === EMPTY_LENGTH) {
      Logger.endTrace('NetworkSecurity.entry.verifyChain', 1);
      Logger.exit('[SecurityViewModel#verifyChain]', 'skipped: busy or unbound');
      return;
    }
    this.busy = true;
    try {
      // Read the bundled server certificate and root CA PEM texts.
      const serverPem: string = CertFileService.readPem(this.context, this.certFiles[SERVER_INDEX].path);
      const caPem: string = this.caPem();
      // Both PEM texts are required for the chain verification.
      if (serverPem.length === EMPTY_LENGTH || caPem.length === EMPTY_LENGTH) {
        this.log('warn', 'CertChain', 'Cannot read the server or CA certificate');
        return;
      }
      // Verify the chain with the sample host name.
      const result: CertVerifyResult = await CertVerifyService.verifyChain(serverPem, caPem, CHAIN_HOST);
      this.recordResult('CertChain', result, this.certFiles[SERVER_INDEX].fileName);
    } finally {
      // Release the busy flag and close the trace section on every path.
      this.busy = false;
      Logger.endTrace('NetworkSecurity.entry.verifyChain', 1);
      Logger.exit('[SecurityViewModel#verifyChain]');
    }
  }

  /**
   * Query whether the global cleartext traffic switch is permitted.
   */
  queryCleartext(): void {
    Logger.enter('[SecurityViewModel#queryCleartext]');
    Logger.beginTrace('NetworkSecurity.entry.queryCleartext', 1);
    // Read the global cleartext switch and keep the host fields unchanged.
    const globalAllowed: boolean = CleartextService.globalAllowed();
    this.cleartext = new CleartextResult(globalAllowed, this.cleartext.host, this.cleartext.hostAllowed);
    this.log('info', 'Cleartext', 'Global cleartext permitted: ' + globalAllowed.toString());
    Logger.endTrace('NetworkSecurity.entry.queryCleartext', 1);
    Logger.exit('[SecurityViewModel#queryCleartext]');
  }

  /**
   * Query whether cleartext traffic is allowed for the typed host name.
   */
  queryHost(): void {
    Logger.enter('[SecurityViewModel#queryHost]');
    Logger.beginTrace('NetworkSecurity.entry.queryHost', 1);
    // Trim the typed host name before the query.
    const host: string = this.hostInput.trim();
    // An empty host name is reported as a warning.
    if (host.length === EMPTY_LENGTH) {
      this.log('warn', 'Cleartext', 'Enter a host name first');
      Logger.endTrace('NetworkSecurity.entry.queryHost', 1);
      Logger.exit('[SecurityViewModel#queryHost]', 'skipped: empty host');
      return;
    }
    // Query the cleartext allowance of the host.
    const allowed: boolean = CleartextService.hostAllowed(host);
    this.cleartext = new CleartextResult(this.cleartext.globalAllowed, host, allowed);
    // Warn when the host is denied, otherwise log as info.
    this.log(allowed ? 'info' : 'warn', 'Cleartext', host + ' cleartext permitted: ' + allowed.toString());
    Logger.endTrace('NetworkSecurity.entry.queryHost', 1);
    Logger.exit('[SecurityViewModel#queryHost]', 'host: ' + host);
  }

  /**
   * Probe the URL allowed by the network policy.
   */
  async probeAllowed(): Promise<void> {
    Logger.enter('[SecurityViewModel#probeAllowed]');
    Logger.beginTrace('NetworkSecurity.entry.probeAllowed', 1);
    // Run the probe against the allowed URL.
    await this.probe($r('app.string.ns_sec_probe_allowed_url'));
    Logger.endTrace('NetworkSecurity.entry.probeAllowed', 1);
    Logger.exit('[SecurityViewModel#probeAllowed]');
  }

  /**
   * Probe the URL denied by the network policy.
   */
  async probeDenied(): Promise<void> {
    Logger.enter('[SecurityViewModel#probeDenied]');
    Logger.beginTrace('NetworkSecurity.entry.probeDenied', 1);
    // Run the probe against the denied URL.
    await this.probe($r('app.string.ns_sec_probe_denied_url'));
    Logger.endTrace('NetworkSecurity.entry.probeDenied', 1);
    Logger.exit('[SecurityViewModel#probeDenied]');
  }

  /**
   * Clear all log entries shown in the log panel.
   */
  clearLogs(): void {
    Logger.enter('[SecurityViewModel#clearLogs]');
    Logger.beginTrace('NetworkSecurity.entry.clearLogs', 1);
    // Reset the log list to empty.
    this.logs = [];
    Logger.endTrace('NetworkSecurity.entry.clearLogs', 1);
    Logger.exit('[SecurityViewModel#clearLogs]');
  }

  /**
   * Read the PEM text of the currently selected certificate file.
   * @returns the PEM text, or an empty string when nothing can be read.
   */
  private selectedPem(): string {
    // Reading needs the bound context and a loaded file list.
    if (this.context === null || this.certFiles.length === EMPTY_LENGTH) {
      return '';
    }
    // Read the selected file from rawfile.
    return CertFileService.readPem(this.context, this.certFiles[this.selectedIndex].path);
  }

  /**
   * Read the PEM text of the bundled root CA certificate.
   * @returns the CA PEM text, or an empty string when nothing can be read.
   */
  private caPem(): string {
    // Reading needs the bound context and a loaded file list.
    if (this.context === null || this.certFiles.length === EMPTY_LENGTH) {
      return '';
    }
    // Read the first file which is the bundled CA.
    return CertFileService.readPem(this.context, this.certFiles[CA_INDEX].path);
  }

  /**
   * Publish a verification result and log the outcome by level.
   * @param tag demo tag used in the log panel.
   * @param result verification result to publish.
   * @param fileName name of the verified certificate file.
   */
  private recordResult(tag: string, result: CertVerifyResult, fileName: string): void {
    // Stamp the file name and publish the result.
    result.fileName = fileName;
    this.lastResult = result;
    // Log success with the elapsed time or failure with the error code.
    if (result.success) {
      this.log('info', tag, fileName + ' passed in ' + result.elapsedMs.toString() + ' ms');
      return;
    }
    this.log('error', tag, fileName + ' failed, code ' + result.code.toString());
  }

  /**
   * Run one HTTP probe and keep the newest results at the head of the list.
   * @param urlResource string resource containing the URL to probe.
   */
  private async probe(urlResource: Resource): Promise<void> {
    if (this.busy || this.context === null) {
      return;
    }
    this.busy = true;
    try {
      const url: string = this.context.resourceManager.getStringSync(urlResource.id);
      // Send the HTTP request and wait for the result.
      const result: HttpProbeResult = await HttpProbeService.probe(url);
      // Build the next list with the new result at the head.
      const next: HttpProbeResult[] = [result];
      const keep: number = this.probeResults.length < PROBE_LIMIT ? this.probeResults.length : PROBE_LIMIT - 1;
      for (let index = 0; index < keep; index++) {
        next.push(this.probeResults[index]);
      }
      // Publish the trimmed result list.
      this.probeResults = next;
      // Build a one-line summary from the HTTP or error code.
      const summary: string =
        result.success ? 'HTTP ' + result.httpCode.toString() : 'code ' + result.errorCode.toString();
      // Log success as info and failure as error.
      this.log(result.success ? 'info' : 'error', 'HttpProbe', url + ' -> ' + summary);
    } finally {
      // Release the busy flag on every path.
      this.busy = false;
    }
  }

  /**
   * Append one entry to the log panel and mirror it to hilog by level.
   * @param level log level, one of info, warn or error.
   * @param tag demo tag used in the log panel.
   * @param text human-readable detail text.
   */
  private log(level: string, tag: string, text: string): void {
    // Advance the sequence and build the entry.
    this.logSeq += 1;
    const entry: LogEntry = new LogEntry(this.logSeq, nowTimeText(), tag, text, level);
    // Append with the limit so the oldest entries are dropped.
    this.logs = appendLog(this.logs, entry, LOG_LIMIT);
    // Mirror the entry to hilog with the demo tag.
    const message: string = '[' + tag + '] ' + text;
    if (level === 'error') {
      Logger.error(message);
      return;
    }
    if (level === 'warn') {
      Logger.warn(message);
      return;
    }
    Logger.info(message);
  }
}
