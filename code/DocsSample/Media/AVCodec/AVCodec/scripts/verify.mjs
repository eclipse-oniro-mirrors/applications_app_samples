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

import { spawnSync } from 'node:child_process';
import { existsSync, mkdirSync, readFileSync, rmSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { runVerification } from './VerificationRunner.mjs';
import { verifyDeviceRun } from './DeviceVerification.mjs';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const args = process.argv.slice(2);
function option(name, fallback) {
  const index = args.indexOf(name);
  if (index < 0) { return fallback; }
  if (!args[index + 1] || args[index + 1].startsWith('--')) { throw new Error('Missing value: ' + name); }
  return args[index + 1];
}
const sdk = option('--sdk', process.env.OHOS_SDK_HOME);
const studio = option('--studio', process.env.DEVECO_STUDIO_HOME);
const distro = option('--wsl-distro', process.env.AVCODEC_WSL_DISTRO);
const output = path.join(root, '.validation');
mkdirSync(output, { recursive: true });
function timeout(name, fallback) {
  const duration = Number(option(name, fallback));
  if (!Number.isSafeInteger(duration) || duration <= 0 || duration > 2_147_483_647) {
    throw new Error('Invalid positive millisecond timeout: ' + name);
  }
  return duration;
}
const testTimeoutMs = timeout('--test-timeout-ms', 60_000);
const compileTimeoutMs = timeout('--compile-timeout-ms', 180_000);
const lintTimeoutMs = timeout('--lint-timeout-ms', 300_000);
const buildTimeoutMs = timeout('--build-timeout-ms', 600_000);
function run(command, values, label, timeoutMs, options = {}) {
  return runVerification(command, values, { cwd: root, label, timeoutMs,
    logDirectory: path.join(output, 'logs'), ...options });
}
function required(value, label) {
  if (!value || !existsSync(value)) { throw new Error('Set ' + label + ' to an existing directory'); }
  return path.resolve(value);
}
function linuxPath(value) {
  if (process.platform !== 'win32') { return value; }
  const result = spawnSync('wsl.exe', ['-d', distro, '--exec', 'wslpath', '-a', '-u', value],
    { encoding: 'utf8', timeout: 10_000 });
  if (result.error) { throw new Error('WSL path conversion: ' + result.error.message); }
  if (result.status !== 0) { throw new Error('Cannot convert WSL path: ' + value); }
  return result.stdout.trim();
}
async function native() {
  const sdkRoot = required(sdk, '--sdk or OHOS_SDK_HOME');
  if (process.platform === 'win32' && !distro) { throw new Error('Set --wsl-distro or AVCODEC_WSL_DISTRO'); }
  const targets = JSON.parse(readFileSync(path.join(root, 'tests/native/targets.json'), 'utf8'));
  const compiler = option('--cxx', process.env.CXX || 'clang++');
  const source = path.join(root, 'entry/src/main/cpp');
  const includes = ['', 'common', 'common/dfx/log', 'capabilities/include', 'render/include',
    'sample/player', 'sample/player/core', 'sample/player/sync', 'sample/recorder/core'].map(part =>
    '-I' + linuxPath(path.join(source, part)));
  const flags = ['-std=c++17', '-pthread', '-ferror-limit=5', '-ffunction-sections', '-fdata-sections',
    '-Wl,--gc-sections', '-Wno-ignored-attributes',
    ...includes, '-idirafter', linuxPath(path.join(sdkRoot, 'native/sysroot/usr/include'))];
  const selection = option('--native-test', '');
  if (selection && !targets[selection]) { throw new Error('Unknown Native test: ' + selection); }
  for (const [name, sources] of Object.entries(targets)) {
    if (selection && name !== selection) { continue; }
    const binary = linuxPath(path.join(output, name));
    const compile = [...flags, linuxPath(path.join(root, 'tests/native', name + '.cpp')),
      ...sources.map(file => linuxPath(path.join(source, file))), '-o', binary];
    console.log('Native: ' + name);
    if (process.platform === 'win32') {
      const bounded = (command, values, label, duration) => run('wsl.exe',
        ['-d', distro, '--exec', 'timeout', '--signal=KILL', duration / 1000 + 's', command, ...values],
        label, duration + 5000, { timeoutExitCodes: [124, 137] });
      await bounded(compiler, compile, 'compile-' + name, compileTimeoutMs);
      await bounded(binary, [], 'native-' + name, testTimeoutMs);
    } else {
      await run(compiler, compile, 'compile-' + name, compileTimeoutMs);
      await run(binary, [], 'native-' + name, testTimeoutMs);
    }
  }
  console.log('Native: ' + (selection ? 1 : Object.keys(targets).length) + ' executables passed');
}
async function host() {
  const compiler = path.join(required(sdk, '--sdk or OHOS_SDK_HOME'),
    'ets/build-tools/ets-loader/node_modules/typescript/lib/typescript.js');
  for (const file of ['RecorderModels', 'TranscodeModels', 'PlaybackConcurrency', 'PlaybackStartup',
    'PlaybackFlow', 'PlaybackQueueState', 'PlaybackCommand', 'PlaybackOrdering', 'PlaybackHistoryCoordinator',
    'PlaybackSourceFlow', 'PlaybackPageLifecycle', 'PlaybackPictureInPicture', 'PlaybackControlFlow',
    'PlaybackContracts',
    'RecordingPageLifecycle', 'RecordingPersistence', 'PlaybackReview']) {
    await run(process.execPath, ['tests/host/' + file + '.test.cjs', compiler], 'host-' + file, testTimeoutMs);
  }
  await run(process.execPath, ['tests/host/VerificationRunner.test.mjs'], 'host-VerificationRunner', testTimeoutMs);
  await run(process.execPath, ['tests/host/DeviceVerification.test.mjs'], 'host-DeviceVerification', testTimeoutMs);
}
async function lint() {
  const entry = path.join(required(studio, '--studio or DEVECO_STUDIO_HOME'), 'plugins/codelinter/run/index.js');
  rmSync(path.join(output, 'lint.json'), { force: true });
  await run(process.execPath, [entry, '-c', path.join(root, 'code-linter.json5'), '-f', 'json',
    '-o', path.join(output, 'lint.json'), '--exit-on', 'error,warn', root], 'lint', lintTimeoutMs,
    { acceptedExitCodes: [0, 2, 4, 6] });
  const findings = JSON.parse(readFileSync(path.join(output, 'lint.json'), 'utf8'));
  if (!Array.isArray(findings)) { throw new Error('Invalid CodeLinter result'); }
  const baseline = JSON.parse(readFileSync(path.join(root, 'tests/lint-baseline.json'), 'utf8'));
  const signature = item => JSON.stringify([item.file, item.rule, item.severity, item.message, item.source]);
  const remaining = new Map();
  for (const item of baseline) {
    const key = signature(item);
    remaining.set(key, (remaining.get(key) || 0) + item.count);
  }
  let existing = 0;
  const added = [];
  for (const file of findings) {
    const relative = path.relative(root, file.filePath).replaceAll('\\', '/');
    const lines = readFileSync(file.filePath, 'utf8').split(/\r?\n/);
    for (const message of file.messages) {
      if (!['error', 'warn'].includes(message.severity)) { continue; }
      const key = signature({ ...message, file: relative, source: lines[message.line - 1].trim() });
      if ((remaining.get(key) || 0) > 0) { remaining.set(key, remaining.get(key) - 1); existing++; }
      else { added.push(relative + ':' + message.line + ' ' + message.rule + ' ' + message.message); }
    }
  }
  console.info(`CodeLinter: ${existing} existing findings; ${added.length} new findings (.validation/lint.json)`);
  if (added.length) { throw new Error(added.join('\n')); }
}
async function build() {
  const studioRoot = required(studio, '--studio or DEVECO_STUDIO_HOME');
  const javaHome = path.join(studioRoot, 'jbr');
  const env = { ...process.env, JAVA_HOME: javaHome };
  const pathKey = Object.keys(env).find(key => key.toLowerCase() === 'path') || 'PATH';
  env[pathKey] = path.join(javaHome, 'bin') + path.delimiter + (env[pathKey] || '');
  await run(process.execPath, [path.join(studioRoot, 'tools/hvigor/bin/hvigorw.js'), '--mode', 'module',
    '-p', 'product=default', '-p', 'module=entry@default', 'assembleHap', '--no-daemon'],
  'build', buildTimeoutMs, { env });
}
async function device() {
  const studioRoot = required(studio, '--studio or DEVECO_STUDIO_HOME');
  const javaHome = path.join(studioRoot, 'jbr');
  const env = { ...process.env, JAVA_HOME: javaHome };
  const pathKey = Object.keys(env).find(key => key.toLowerCase() === 'path') || 'PATH';
  env[pathKey] = path.join(javaHome, 'bin') + path.delimiter + (env[pathKey] || '');
  const scope = option('--device-scope', '');
  const expectedCount = Number(option('--expected-device-tests', scope ? '' : '49'));
  if (!Number.isSafeInteger(expectedCount) || expectedCount <= 0) {
    throw new Error('Set --expected-device-tests to the expected positive case count for the selected scope');
  }
  const values = [path.join(studioRoot, 'tools/hvigor/bin/hvigorw.js'), '--mode', 'module',
    '-p', 'product=default', '-p', 'module=entry', '-p', 'coverage=true'];
  if (scope) { values.push('-p', 'scope=' + scope); }
  values.push('onDeviceTest', '--no-daemon');
  const result = await verifyDeviceRun({ expectedCount, scope,
    reportPath: path.join(root, 'entry/.test/default/intermediates/ohosTest/coverage_data/test_result.txt'),
    resultPath: path.join(output, 'device-result.json'),
    execute: () => run(process.execPath, values, 'device', buildTimeoutMs, { env }) });
  console.info(`Device: ${result.pass}/${result.run} passed; report: ${result.reportPath}`);
}
try {
  const stage = option('--only', 'all');
  const stages = { host, native, lint, build };
  if (stage === 'device') { await device(); }
  else if (stage === 'all') { for (const action of Object.values(stages)) { await action(); } }
  else if (stages[stage]) { await stages[stage](); }
  else { throw new Error('Unknown --only stage: ' + stage); }
  console.log('Verification passed: ' + stage);
} catch (error) { console.error(error.message); process.exitCode = 1; }
