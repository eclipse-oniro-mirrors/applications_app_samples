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
import { readFileSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { runVerification } from '../../scripts/VerificationRunner.mjs';

const cwd = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
const options = { cwd, logDirectory: path.join(cwd, '.validation/runner-tests'), timeoutMs: 5000, quiet: true };
const success = await runVerification(process.execPath, ['-e', "process.stdout.write('out');process.stderr.write('err')"],
  { ...options, label: 'success' });
assert.match(readFileSync(success.logPath, 'utf8'), /out/);
assert.match(readFileSync(success.logPath, 'utf8'), /err/);
await assert.rejects(runVerification(process.execPath, ['-e', 'process.exit(7)'], { ...options, label: 'nonzero' }),
  /nonzero exited with 7; log:/);
await runVerification(process.execPath, ['-e', 'process.exit(6)'],
  { ...options, label: 'allowed-exit', acceptedExitCodes: [0, 6] });
await assert.rejects(runVerification(process.execPath, ['-e', 'process.exit(124)'],
  { ...options, label: 'inner-timeout', timeoutExitCodes: [124, 137] }), /inner-timeout timed out inside command/);
await assert.rejects(runVerification('avcodec-nonexistent-test-command', [], { ...options, label: 'missing' }),
  /missing.*ENOENT.*log:/);
const started = Date.now();
await assert.rejects(runVerification(process.execPath, ['-e', 'setInterval(() => {}, 1000)'],
  { ...options, label: 'hung-test', timeoutMs: 200 }), /hung-test timed out after 200ms; log:/);
assert(Date.now() - started < 10_000, 'A hung process must not hold the verification runner indefinitely');
await runVerification(process.execPath, ['-e', 'process.exit(0)'], { ...options, label: 'after-timeout' });
const childSource = "const {spawn}=require('node:child_process');" +
  "const child=spawn(process.execPath,['-e','setInterval(() => {}, 1000)'],{stdio:'inherit'});" +
  "console.log('child-pid:'+child.pid);setInterval(() => {}, 1000);";
await assert.rejects(runVerification(process.execPath, ['-e', childSource],
  { ...options, label: 'hung-tree', timeoutMs: 1000 }), /hung-tree timed out/);
const childPid = Number(readFileSync(path.join(options.logDirectory, 'hung-tree.log'), 'utf8')
  .match(/child-pid:([0-9]+)/)?.[1]);
assert(Number.isSafeInteger(childPid) && childPid > 0);
assert.throws(() => process.kill(childPid, 0), error => error.code === 'ESRCH', 'Timeout also terminates descendants');
console.info('Verification runner: exit codes, startup failure, stdout/stderr logs and forced timeout passed');
