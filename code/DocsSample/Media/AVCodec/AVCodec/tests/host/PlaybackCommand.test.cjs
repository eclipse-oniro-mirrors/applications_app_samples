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
const { fixture: coreFixture, load, deferred } = require('./helpers/PlaybackFlowFixture.cjs');

async function fixture() {
  const f = coreFixture(); await f.start();
  f.controlEvents = []; f.controlInput = { active: true, dragging: false, thermalWarning: false, paused: false };
  const { SeekRequestController } = load('controller/SeekRequestController.ets', {});
  f.requests = []; f.seeks = new SeekRequestController(target => {
    const gate = deferred(); f.requests.push({ target, ...gate }); return gate.promise;
  });
  const { PlaybackCommandController } = load('controller/PlaybackCommandController.ets', {
    '../common/utils/Logger': { default: { error: (...args) => f.warnings.push(args) } }
  });
  f.commands = new PlaybackCommandController(f.state, f.seeks, {
    getSnapshot: () => f.controlInput, onEvent: event => f.controlEvents.push(event)
  }, f.runtime);
  return f;
}
async function testSeekRestoration() {
  for (const thermalWarning of [false, true]) {
    const f = await fixture(); const seeking = f.commands.seek(3_000_000);
    f.commands.setSpeed(2); f.controlInput.thermalWarning = thermalWarning;
    assert.equal(f.state.requestedSpeed, 2); assert.equal(f.nativeControls.length, 0);
    f.commands.togglePause(true); assert.equal(f.controlEvents.at(-1).type, 'busy');
    f.requests[0].resolve(true); await seeking;
    assert.deepEqual(f.nativeControls, [['after-seek', 2, thermalWarning]]);
    assert.equal(f.controlEvents.some(event => event.type === 'seek_settled'), true);
    f.commands.setSpeed(1.5); assert.deepEqual(f.nativeControls.at(-1), ['speed', 1.5]);
  }
  const dragging = await fixture(); dragging.controlInput.dragging = true;
  const seek = dragging.commands.seek(100); dragging.requests[0].resolve(false); await seek;
  assert.equal(dragging.nativeControls.length, 0);
  assert.equal(dragging.controlEvents.at(-1).type, 'seek_failed');
}
async function testStaleSeekOwnership() {
  for (const action of ['stop', 'stop-rejected', 'leave', 'replay', 'complete']) {
    const f = await fixture(); const seeking = f.commands.seek(100);
    if (action === 'leave') { f.controlInput.active = false; }
    else if (action === 'replay') { f.complete(); await f.start(); }
    else if (action === 'complete') { f.complete(); }
    else {
      if (action === 'stop-rejected') { f.runtime.stop = () => false; }
      await f.flow.stop();
    }
    const events = f.controlEvents.length; f.requests[0].resolve(false); await seeking;
    assert.equal(f.controlEvents.length, events, action + ': stale result emits no display events');
    assert.equal(f.nativeControls.length, 0, action + ': stale result restores no controls');
  }
  const f = await fixture(); const old = f.commands.seek(100), latest = f.commands.seek(200);
  f.requests[0].resolve(true); await old;
  assert.equal(f.nativeControls.length, 0); assert.equal(f.requests[1].target, 200);
  f.requests[1].resolve(true); await latest;
  assert.deepEqual(f.nativeControls, [['after-seek', 1, false]]);
}
async function testNativePauseAuthority() {
  const f = await fixture();
  f.controlInput.paused = true;
  assert.equal(f.commands.setPaused(true), true);
  assert.deepEqual(f.nativeControls, [['paused', true]], 'Stale page cannot suppress Native pause');
  assert.equal(f.commands.setPaused(true), true);
  assert.equal(f.nativeControls.length, 1, 'Repeated pause performs no Native call');
  f.controlInput.paused = false;
  assert.equal(f.commands.setPaused(false), true);
  assert.deepEqual(f.nativeControls.at(-1), ['paused', false], 'Stale page cannot suppress Native resume');
  assert.equal(f.commands.setPaused(false), true);
  assert.equal(f.nativeControls.length, 2);
  f.commands.togglePause(); f.commands.togglePause();
  assert.deepEqual(f.nativeControls.slice(-2), [['paused', true], ['paused', false]]);
  f.nativeState = f.states.STOPPING;
  assert.equal(f.commands.setPaused(false), false);
  assert.equal(f.nativeControls.length, 4, 'Native stopping rejects controls despite active page');
}
async function testPauseAndGuards() {
  const f = await fixture(); f.commands.togglePause(true);
  assert.deepEqual(f.nativeControls, [['paused', true]]);
  assert.equal(f.controlEvents.at(-1).type, 'paused'); assert.equal(f.controlEvents.at(-1).showPrompt, true);
  f.controlInput.paused = true; f.commands.togglePause();
  assert.deepEqual(f.nativeControls.at(-1), ['paused', false]);
  assert.equal(f.controlEvents.at(-1).type, 'resumed');
  f.runtime.setPaused = () => false; const events = f.controlEvents.length; f.commands.togglePause();
  assert.equal(f.controlEvents.length, events); assert.equal(f.warnings.length, 1);
  for (const speed of [0, -1, NaN, Infinity]) { f.commands.setSpeed(speed); }
  assert.equal(f.state.requestedSpeed, 1);
  f.controlInput.active = false; const count = f.nativeControls.length;
  assert.equal(await f.commands.seek(100), 'cancelled'); f.commands.setSpeed(2); f.commands.togglePause();
  assert.equal(f.nativeControls.length, count);
}
(async () => {
  await testNativePauseAuthority();
  await testSeekRestoration(); await testStaleSeekOwnership(); await testPauseAndGuards();
  console.info('Playback commands: seek identity, latest speed, thermal restore, pause and guards passed');
})().catch(error => { console.error(error); process.exitCode = 1; });
