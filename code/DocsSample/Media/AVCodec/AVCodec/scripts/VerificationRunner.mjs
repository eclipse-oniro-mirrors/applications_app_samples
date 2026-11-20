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

import { spawn, spawnSync } from 'node:child_process';
import { closeSync, mkdirSync, openSync, writeSync } from 'node:fs';
import path from 'node:path';

export function runVerification(command, args, options) {
  const { label, timeoutMs, logDirectory, cwd, env = process.env, acceptedExitCodes = [0],
    timeoutExitCodes = [], quiet = false } = options;
  if (!Number.isSafeInteger(timeoutMs) || timeoutMs <= 0) {
    throw new Error('Invalid timeout for ' + label);
  }
  mkdirSync(logDirectory, { recursive: true });
  const logPath = path.join(logDirectory, label.replace(/[^a-zA-Z0-9_.-]/g, '_') + '.log');
  return new Promise((resolve, reject) => {
    const fd = openSync(logPath, 'w');
    writeSync(fd, label + ' started; timeout=' + timeoutMs + 'ms' + '\n');
    const child = spawn(command, args, { cwd, env, detached: process.platform !== 'win32', stdio: ['ignore', 'pipe', 'pipe'] });
    let timedOut = false;
    let spawnError;
    const output = (chunk, target) => {
      writeSync(fd, chunk);
      if (!quiet) { target.write(chunk); }
    };
    child.stdout.on('data', chunk => output(chunk, process.stdout));
    child.stderr.on('data', chunk => output(chunk, process.stderr));
    child.once('error', error => { spawnError = error; });
    const timer = setTimeout(() => {
      timedOut = true;
      writeSync(fd, label + ' timed out; terminating process tree' + '\n');
      if (!child.pid) { return; }
      if (process.platform === 'win32') {
        const killed = spawnSync('taskkill.exe', ['/PID', String(child.pid), '/T', '/F'],
          { stdio: 'ignore', timeout: 10_000 });
        if (killed.status !== 0) { child.kill('SIGKILL'); }
      } else {
        try { process.kill(-child.pid, 'SIGKILL'); } catch (error) {
          if (error.code !== 'ESRCH') { child.kill('SIGKILL'); }
        }
      }
    }, timeoutMs);
    child.once('close', (code, signal) => {
      clearTimeout(timer);
      writeSync(fd, label + ' exited: ' + code + '; signal=' + signal + '\n');
      closeSync(fd);
      const innerTimeout = timeoutExitCodes.includes(code);
      const reason = timedOut ? 'timed out after ' + timeoutMs + 'ms' :
        (innerTimeout ? 'timed out inside command (exit ' + code + ')' :
        (spawnError ? spawnError.message : 'exited with ' + code + (signal ? ' (' + signal + ')' : '')));
      if (timedOut || innerTimeout || spawnError || !acceptedExitCodes.includes(code)) {
        reject(new Error(label + ' ' + reason + '; log: ' + logPath));
      } else {
        resolve({ code, logPath });
      }
    });
  });
}
