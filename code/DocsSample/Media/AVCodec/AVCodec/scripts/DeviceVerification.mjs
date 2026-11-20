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

import { mkdirSync, readFileSync, rmSync, statSync, writeFileSync } from 'node:fs';
import path from 'node:path';

function readCases(source) {
  const cases = [];
  let suite = '', name = '';
  for (const line of source.split(/\r?\n/)) {
    if (line.startsWith('class=')) { suite = line.slice(6).trim(); }
    if (line.startsWith('test=')) {
      if (name) { throw new Error('Device case has no result: ' + name); }
      name = line.slice(5).trim();
    }
    if (!line.startsWith('result=')) { continue; }
    if (!suite || !name) { throw new Error('Device result has no suite or case'); }
    cases.push({ suite, name, result: line.slice(7).trim() });
    name = '';
  }
  if (name) { throw new Error('Device case has no result: ' + name); }
  return cases;
}

export function parseDeviceReport(source, expectedCount, scope = '') {
  if (!Number.isSafeInteger(expectedCount) || expectedCount <= 0) {
    throw new Error('Expected device case count must be a positive integer');
  }
  const pattern = /Tests run:\s*(\d+),\s*Failure:\s*(\d+),\s*Error:\s*(\d+),\s*Pass:\s*(\d+),\s*Ignore:\s*(\d+)/g;
  const summaries = [...source.matchAll(pattern)];
  if (summaries.length !== 1) { throw new Error('Device report must contain one complete summary'); }
  const [run, failure, error, pass, ignore] = summaries[0].slice(1).map(Number);
  if (run !== expectedCount || run !== pass || failure !== 0 || error !== 0 || ignore !== 0) {
    throw new Error(`Device assertions failed or incomplete: run=${run}, pass=${pass}, ` +
      `failure=${failure}, error=${error}, ignore=${ignore}, expected=${expectedCount}`);
  }
  const cases = readCases(source);
  const ids = new Set(cases.map(item => item.suite + '#' + item.name));
  if (cases.length !== run || ids.size !== run || cases.some(item => item.result !== 'Success')) {
    throw new Error('Device case results do not match the passing summary');
  }
  const selections = scope ? scope.split(',') : [];
  if (selections.some(selection => !cases.some(item => selection === item.suite ||
    selection === item.suite + '#' + item.name)) || (selections.length && cases.some(item =>
    !selections.includes(item.suite) && !selections.includes(item.suite + '#' + item.name)))) {
    throw new Error('Device case selection does not match the requested scope');
  }
  return { run, failure, error, pass, ignore, suites: [...new Set(cases.map(item => item.suite))], cases };
}

// 删除旧报告后执行本次任务；进程成功仍须逐项校验断言和报告归属。
export async function verifyDeviceRun(options) {
  const { reportPath, resultPath, expectedCount, scope = '', execute } = options;
  const started = Date.now();
  mkdirSync(path.dirname(resultPath), { recursive: true });
  const result = { status: 'running', reportPath, expectedCount, scope };
  writeFileSync(resultPath, JSON.stringify(result, null, 2) + '\n');
  try {
    rmSync(reportPath, { force: true });
    const execution = await execute();
    result.logPath = execution.logPath;
    const metadata = statSync(reportPath);
    if (!metadata.isFile() || metadata.size === 0 || metadata.mtimeMs < started) {
      throw new Error('Device report is empty or stale: ' + reportPath);
    }
    Object.assign(result, parseDeviceReport(readFileSync(reportPath, 'utf8'), expectedCount, scope),
      { status: 'passed' });
    return result;
  } catch (error) {
    result.status = 'failed';
    result.message = error.message;
    throw error;
  } finally {
    writeFileSync(resultPath, JSON.stringify(result, null, 2) + '\n');
  }
}
