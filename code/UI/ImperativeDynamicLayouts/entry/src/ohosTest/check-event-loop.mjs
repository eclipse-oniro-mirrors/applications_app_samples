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

import assert from 'node:assert/strict';
import { readdirSync, readFileSync } from 'node:fs';
import { stripTypeScriptTypes } from 'node:module';
import { runInNewContext } from 'node:vm';

const root = new URL('./ets/test/', import.meta.url);
const helper = readFileSync(new URL('TestEventLoop.ets', root), 'utf8');
let resume;
const yieldToEventLoop = runInNewContext(
  stripTypeScriptTypes(helper.replace('export function', 'function')) + '\nyieldToEventLoop;',
  { Promise, setTimeout: (callback, delay) => { assert.equal(delay, 1); resume = callback; } }
);
let completed = false;
const pending = yieldToEventLoop().then(() => { completed = true; });
await Promise.resolve();
assert.equal(completed, false, 'The hook must wait for a timer, not only a Promise microtask');
assert.equal(typeof resume, 'function');
resume();
await pending;
assert.equal(completed, true);

let suites = 0;
let cases = 0;
for (const file of readdirSync(root, { recursive: true })) {
  if (!file.endsWith('.test.ets') || file === 'List.test.ets') continue;
  const source = readFileSync(new URL(file.replaceAll('\\', '/'), root), 'utf8');
  const descriptions = [...source.matchAll(/describe\('[^']+', \(\) => \{/g)];
  assert.equal(descriptions.length, 1, file);
  assert.match(source, /import \{[^}]*\bbeforeEach\b[^}]*\} from '@ohos\/hypium'/, file);
  assert.match(source, /import \{ yieldToEventLoop \} from '\.\.?\/TestEventLoop'/, file);
  assert.match(source.slice(descriptions[0].index), /^describe\('[^']+', \(\) => \{\r?\n    beforeEach\(yieldToEventLoop\);/, file);
  suites++;
  cases += [...source.matchAll(/\bit\('[^']+',/g)].length;
}
assert.equal(suites, 54, 'Keep all existing suites covered');
const list = readFileSync(new URL('List.test.ets', root), 'utf8');
const body = list.match(/export default function testsuite\(\) \{([\s\S]*?)\}/)[1];
const registrations = body.trim().split(/\r?\n/).map(line => line.trim());
assert.ok(registrations.every(line => /^\w+\(\);$/.test(line)), 'Keep IDE-discoverable direct suite calls');
assert.equal(registrations.length, suites);
console.log('PASS: awaited timer, ' + suites + ' suite hooks, ' + cases + ' literal cases, direct registration calls');
