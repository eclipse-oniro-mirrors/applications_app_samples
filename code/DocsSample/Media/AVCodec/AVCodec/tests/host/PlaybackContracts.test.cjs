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

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const ts = require(path.resolve(process.argv[2]));
const { fixture } = require('./helpers/PlaybackFlowFixture.cjs');
const directory = path.resolve(__dirname, '../../.validation/contracts');
const source = path.resolve(__dirname, '../../entry/src/main/ets/controller');

function compileProbe(probe) {
  const normalize = file => path.resolve(file).replaceAll('\\', '/').toLowerCase();
  const files = new Map();
  for (const name of ['PlaybackFlowState', 'PlaybackFlowEvent']) {
    files.set(normalize(path.join(directory, name + '.ts')),
      fs.readFileSync(path.join(source, name + '.ets'), 'utf8'));
  }
  const entry = path.join(directory, 'probe.ts');
  files.set(normalize(entry), "import { PlaybackFlowView, PlaybackCommandState } from './PlaybackFlowState';\n" +
    "import { PlaybackFlowEvent, PlaybackPreparingEvent, PlaybackNoticeEvent } from './PlaybackFlowEvent';\n" +
    'declare const view: PlaybackFlowView; declare const command: PlaybackCommandState;\n' + probe);
  const options = { strict: true, noEmit: true, target: ts.ScriptTarget.ES2020 };
  const host = ts.createCompilerHost(options);
  const originalRead = host.readFile.bind(host), originalExists = host.fileExists.bind(host);
  const originalSource = host.getSourceFile.bind(host);
  host.fileExists = file => files.has(normalize(file)) || originalExists(file);
  host.readFile = file => files.get(normalize(file)) ?? originalRead(file);
  host.directoryExists = () => true;
  host.getSourceFile = (file, version) => files.has(normalize(file)) ?
    ts.createSourceFile(file, files.get(normalize(file)), version, true) : originalSource(file, version);
  return ts.getPreEmitDiagnostics(ts.createProgram([entry], options, host));
}

function testTypeContracts() {
  assert.deepEqual(compileProbe("new PlaybackPreparingEvent('A', false); new PlaybackNoticeEvent('busy');" +
    "PlaybackFlowEvent.signal('started'); command.setRequestedSpeed(2); const phase = view.phase;"), []);
  for (const probe of [
    'view.session = 2;', "view.activePath = 'B';", "view.phase = 'active';",
    "view.transition('active');", 'view.setRequestedSpeed(2);', "command.transition('idle');",
    "new PlaybackPreparingEvent('A');", 'new PlaybackNoticeEvent();',
    "PlaybackFlowEvent.signal('preparing');", "PlaybackFlowEvent.signal('notice');",
    "const event: PlaybackFlowEvent = { type: 'preparing' };"
  ]) {
    assert(compileProbe(probe).length > 0, 'Invalid contract unexpectedly compiles: ' + probe);
  }
}

async function testRuntimeStateOwnership() {
  const f = fixture(); await f.start();
  const session = f.state.session;
  assert.equal(Reflect.set(f.state, 'session', session + 10), false);
  assert.equal(Reflect.set(f.state, 'activePath', 'B'), false);
  assert.equal(f.state.session, session); assert.equal(f.state.activePath, 'A');
  f.complete(); assert.equal(f.state.activePath, null);
  await f.start(); assert.equal(f.state.session, session + 1);
}

testTypeContracts();
testRuntimeStateOwnership().then(() => {
  console.info('Playback contracts: readonly consumer state, owned generations and required event payloads passed');
}).catch(error => { console.error(error); process.exitCode = 1; });
