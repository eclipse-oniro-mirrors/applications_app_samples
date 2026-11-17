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

const fs = require('node:fs');
const path = require('node:path');
const { execFileSync } = require('node:child_process');
const { createHash } = require('node:crypto');
const root = path.resolve(__dirname, '..');
const inputs = ['entry/src/main', 'AppScope', 'entry/oh-package.json5', 'entry/hvigorfile.ts',
  'entry/build-profile.json5', 'hvigorfile.ts', 'oh-package.json5', 'hvigor/hvigor-config.json5', 'scripts'];
const names = [];
function collect(relative) {
  if (relative === 'entry/src/main/resources/rawfile/build-info.json') { return; }
  const file = path.join(root, relative);
  if (!fs.existsSync(file)) { return; }
  const stat = fs.lstatSync(file);
  if (stat.isSymbolicLink()) { return; }
  if (stat.isDirectory()) {
    for (const name of fs.readdirSync(file)) { collect(relative + '/' + name); }
  } else if (stat.isFile()) { names.push(relative); }
}
inputs.forEach(collect);
const digest = createHash('sha256');
for (const file of names.sort()) {
  digest.update(file + '\0');
  digest.update(fs.readFileSync(path.join(root, file)));
  digest.update('\0');
}
let revision = 'unknown';
try {
  revision = execFileSync('git', ['rev-parse', 'HEAD'], { cwd: root, encoding: 'utf8',
    windowsHide: true, stdio: ['ignore', 'pipe', 'ignore'] }).trim();
} catch { /* 源码压缩包没有Git记录，仍可构建并记录源码校验值。 */ }
const app = fs.readFileSync(path.join(root, 'AppScope/app.json5'), 'utf8');
const appVersion = /"versionName"\s*:\s*"([^"]+)"/.exec(app)?.[1];
if (!appVersion) { throw new Error('Missing app versionName'); }
const info = { appVersion, revision, sourceDigest: digest.digest('hex'), builtAt: new Date().toISOString() };
const target = path.join(root, 'entry/src/main/resources/rawfile/build-info.json');
fs.mkdirSync(path.dirname(target), { recursive: true });
fs.writeFileSync(target, JSON.stringify(info) + '\n');
