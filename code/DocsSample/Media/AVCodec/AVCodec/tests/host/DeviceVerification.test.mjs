/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import assert from 'node:assert/strict';
import { existsSync, mkdirSync, mkdtempSync, readFileSync, utimesSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { parseDeviceReport, verifyDeviceRun } from '../../scripts/DeviceVerification.mjs';
import { runVerification } from '../../scripts/VerificationRunner.mjs';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
const output = path.join(root, '.validation/device-runner-tests');
mkdirSync(output, { recursive: true });
const directory = mkdtempSync(path.join(output, 'run-'));
const reportPath = path.join(directory, 'test_result.txt');
const resultPath = path.join(directory, 'result.json');
const passing = 'class=Suite\ntest=Case\nresult=Success\n' +
  'Tests run: 1, Failure: 0, Error: 0, Pass: 1, Ignore: 0\n';

function testReportValidation() {
  assert.equal(parseDeviceReport(passing, 1).pass, 1);
  assert.equal(parseDeviceReport(passing, 1, 'Suite#Case').cases.length, 1);
  for (const [source, count, scope] of [
    ['', 1], [passing, 0], [passing, 2], [passing, 1, 'Other'],
    [passing.replace('Failure: 0', 'Failure: 1'), 1],
    [passing.replace('Error: 0', 'Error: 1'), 1],
    [passing.replace('Ignore: 0', 'Ignore: 1'), 1],
    [passing.replace('result=Success', 'result=Fail'), 1],
    [passing.replace('test=Case\nresult=Success\n', ''), 1],
    [passing + passing, 1],
    [passing.replace('Tests run: 1', 'Tests run: 0'), 1]
  ]) {
    assert.throws(() => parseDeviceReport(source, count, scope));
  }
}

async function testFreshReportOwnership() {
  writeFileSync(reportPath, passing);
  const options = { reportPath, resultPath, expectedCount: 1 };
  const result = await verifyDeviceRun({ ...options, execute: async () => {
    assert.equal(existsSync(reportPath), false, 'The previous report is removed before execution');
    writeFileSync(reportPath, passing); return { logPath: 'run.log' };
  } });
  assert.equal(result.status, 'passed');
  assert.equal(JSON.parse(readFileSync(resultPath, 'utf8')).pass, 1);
  await assert.rejects(verifyDeviceRun({ ...options, execute: async () => ({}) }), /ENOENT/);
  assert.equal(JSON.parse(readFileSync(resultPath, 'utf8')).status, 'failed');
  await assert.rejects(verifyDeviceRun({ ...options, execute: async () => {
    writeFileSync(reportPath, passing); utimesSync(reportPath, 1, 1); return {};
  } }), /stale/);
  await assert.rejects(verifyDeviceRun({ ...options, execute: async () => {
    writeFileSync(reportPath, passing); throw new Error('device timed out');
  } }), /timed out/);
  assert.equal(JSON.parse(readFileSync(resultPath, 'utf8')).status, 'failed');
}

async function testSuccessfulProcessWithFailedAssertions() {
  const command = 'require("node:fs").writeFileSync(process.argv[1], process.argv[2]);';
  await assert.rejects(verifyDeviceRun({ reportPath, resultPath, expectedCount: 1,
    execute: () => runVerification(process.execPath, ['-e', command, reportPath,
      passing.replace('Failure: 0', 'Failure: 1')],
    { cwd: root, logDirectory: directory, label: 'exit-zero-failure', timeoutMs: 5000, quiet: true })
  }), /assertions failed/);
  assert.equal(JSON.parse(readFileSync(resultPath, 'utf8')).status, 'failed');
}

testReportValidation();
await testFreshReportOwnership();
await testSuccessfulProcessWithFailedAssertions();
console.info('Device verification: fresh reports, exact counts, case scope, failed assertions and timeout passed');
