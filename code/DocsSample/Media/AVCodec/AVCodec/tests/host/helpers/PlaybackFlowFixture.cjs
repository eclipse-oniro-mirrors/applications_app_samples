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
const vm = require('node:vm');
const ts = require(path.resolve(process.argv[2]));
const sourceRoot = path.resolve(__dirname, '../../../entry/src/main/ets');
const states = { IDLE: 0, PLAYING: 3, STOPPING: 4, PAUSED: 6 };
const noOp = () => {};

function deferred() {
  let resolve, reject;
  const promise = new Promise((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
}
function load(relative, mocks, globals = {}) {
  const file = path.join(sourceRoot, relative);
  const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    compilerOptions: { target: ts.ScriptTarget.ES2020, module: ts.ModuleKind.CommonJS }, reportDiagnostics: true
  });
  assert.equal(compiled.diagnostics.length, 0);
  const module = { exports: {} };
  vm.runInNewContext(compiled.outputText, { module, exports: module.exports, ...globals,
    require(name) { assert(mocks[name], name); return mocks[name]; } }, { filename: file });
  return module.exports;
}
function fixtureInputs() {
  return { active: true, path: 'A', options: { settings: { audioVolume: 100, resumeLastPosition: false },
    smartFluency: false, autoRecovery: false, mode: 0, muted: false },
    progress: { positionUs: 10_000_000, durationUs: 60_000_000, mediaDurationUs: 60_000_000 },
    events: [], notices: [], prepares: [], launches: [], history: [], warnings: [], timers: new Map(), timerId: 0,
    stopCalls: 0, sessionStops: 0, nativeState: states.IDLE, flushCalls: 0,
    markCompleted: async () => true, completedInfo: { durationUs: 60_000_000 },
    nativeControls: [], seekTargets: [], resumeQueries: [], seekIdle: async () => {},
    sessionStop: async () => {}, persist: async () => true, flush: async () => true };
}
const flowEvents = load('controller/PlaybackFlowEvent.ets', {});
function checkpoints(f) {
  f.trace = []; f.checkpoints = new Map(); f.checkpointWaiters = [];
  f.record = name => {
    f.trace.push(name); f.checkpoints.set(name, (f.checkpoints.get(name) ?? 0) + 1);
    for (const waiter of f.checkpointWaiters.slice()) {
      if ((f.checkpoints.get(waiter.name) ?? 0) >= waiter.count) {
        f.checkpointWaiters.splice(f.checkpointWaiters.indexOf(waiter), 1); waiter.resolve();
      }
    }
  };
  f.waitAt = (name, count = 1) => {
    if ((f.checkpoints.get(name) ?? 0) >= count) { return Promise.resolve(); }
    return new Promise((resolve, reject) => {
      const timer = setTimeout(() => reject(Error('Missing checkpoint: ' + name +
        ' Trace: ' + f.trace.join(' -> '))), 2000);
      f.checkpointWaiters.push({ name, count, resolve: () => { clearTimeout(timer); resolve(); } });
    });
  };
}
function createRuntime(f) {
  return { stoppingState: states.STOPPING, playingState: states.PLAYING, pausedState: states.PAUSED,
    isTranscoding: () => f.transcoding === true,
    prepare(uri) {
      const gate = deferred(); f.prepares.push({ uri, ...gate });
      f.record('prepare:' + uri); return gate.promise;
    },
    async launch(context, uri, settings, smart, prepare, complete) {
      if (f.launchError) {
        return { kind: f.launchError === 'close_unconfirmed' ? 'close_pending' : 'rejected', reason: f.launchError };
      }
      const lease = { id: 'lease-' + f.launches.length }; prepare(lease);
      const started = f.startResult?.started ?? true, owns = f.startResult?.nativeOwnsLease ?? true;
      f.nativeState = owns ? states.PLAYING : states.IDLE;
      f.launches.push({ uri, settings, smart, lease, complete }); f.record('launch:' + uri);
      const gate = f.startGate;
      const result = gate === undefined ? undefined : await gate.promise;
      if (result !== undefined) { f.nativeState = result.completionOwned ? states.PLAYING : states.IDLE; return result; }
      return { kind: started ? 'started' : (owns ? 'releasing' : 'rejected'), reason: started ? 'none' : 'invalid' };
    }, cancelling(lease) { f.cancelledLease = lease; },
    stop() {
      f.stopCalls++; f.record('stop');
      if (f.nativeState !== states.PLAYING && f.nativeState !== states.PAUSED) { return false; }
      f.nativeState = states.STOPPING; return true;
    }, getState: () => f.nativeState, completedDuration: () => f.completedInfo.durationUs,
    restoreControls(speed, paused, volume) {
      f.nativeControls.push(['volume', volume], ['speed', speed]);
      if (paused) { f.nativeControls.push(['pause']); f.nativeState = states.PAUSED; }
    }, setSpeed(speed) { f.nativeControls.push(['speed', speed]); },
    setPaused(paused) {
      f.nativeControls.push(['paused', paused]); f.nativeState = paused ? states.PAUSED : states.PLAYING; return true;
    },
    restoreAfterSeek(speed, thermalWarning) { f.nativeControls.push(['after-seek', speed, thermalWarning]); },
    schedule(callback, delayMs) {
      const id = ++f.timerId; f.timers.set(id, callback); f.scheduledDelay = delayMs; return id;
    }, cancelTimer(id) { f.timers.delete(id); } };
}
function createHistory(f) {
  return { getEntries: () => f.history.slice(), async update(uri, title, position, duration, force) {
    f.history.push({ uri, title, position, duration, force }); f.record('save:' + uri);
    const saved = await f.persist(); f.record('saved:' + uri); return saved;
  }, async flush() { f.flushCalls++; f.record('flush');
      try { return await f.flush(); } finally { f.record('flushed'); }
    },
    markCompleted(uri, durationUs) {
      f.history.push({ uri, completed: true, durationUs }); return f.markCompleted(uri, durationUs);
    }, getResumePosition(uri, durationUs, enabled) {
      f.resumeQueries.push({ uri, durationUs, enabled }); return 0;
    } };
}
function createHost(f) {
  return { getContext: () => ({}), isActive: () => f.active, getPath: () => f.path,
    setPath: uri => { f.path = uri; }, getOptions: () => f.options, getProgress: () => f.progress,
    seekTo: positionUs => f.seekTo(positionUs), onEvent() {} };
}
function fixture(hostFactory, seekFactory) {
  const f = fixtureInputs(); checkpoints(f);
  f.logger = { info() {}, warn: (tag, message) => f.warnings.push(message), error() {} };
  f.runtime = createRuntime(f); f.historyModel = createHistory(f);
  f.seeks = { isBusy: () => false, resetStatistics: noOp, cancel: noOp, waitForIdle: () => f.seekIdle() };
  if (seekFactory) { f.seeks = seekFactory(f); }
  f.session = { updateState: (...args) => { f.sessionState = args; },
    stop() { f.sessionStops++; f.record('session-stop'); return f.sessionStop(); } };
  f.seekTo = async positionUs => { f.seekTargets.push(positionUs); f.record('seek'); return 'completed'; };
  const { PlaybackQueueController } = load('controller/PlaybackQueueController.ets', {
    '../model/PlaybackModeModel': load('model/PlaybackModeModel.ets', {})
  }, { Observed: target => target });
  f.queue = new PlaybackQueueController(); f.queue.replace(['A', 'B', 'C'], 0);
  f.queue.next = () => -1;
  const flow = load('controller/PlaybackFlowController.ets', {
    './PlaybackFlowEvent': flowEvents,
    '../model/PlaybackRecoveryModel': load('model/PlaybackRecoveryModel.ets', {}),
    '../common/utils/Logger': { default: f.logger }
  }, { Observed: target => target });
  const { PlaybackHistoryCoordinator } = load('controller/PlaybackHistoryCoordinator.ets', {
    '../model/PlaybackHistoryModel': { getPlaybackTitle: uri => uri },
    '../common/utils/Logger': { default: f.logger }
  });
  f.saving = new PlaybackHistoryCoordinator(f.historyModel, () => {
    f.historyChanges = (f.historyChanges ?? 0) + 1; f.onHistoryChanged?.();
  });
  const host = hostFactory ? hostFactory(f) : createHost(f);
  const receive = host.onEvent; host.onEvent = event => {
    f.events.push(event); f.record('event:' + event.type);
    if (event.type === 'notice') { f.notices.push(event.notice); }
    receive(event);
  };
  f.flow = new flow.PlaybackFlowController(host, f.queue, f.saving, f.seeks, f.session, f.runtime);
  f.state = f.flow.view;
  return Object.assign(f, { states, async start() {
    const starting = f.flow.play(); f.prepares.at(-1).resolve(); await starting;
  }, complete(reason = 'stopped', cleanupPending = false) {
    f.nativeState = states.IDLE; f.record('complete:' + reason);
    f.launches.at(-1).complete({ reason, success: reason === 'completed' }, cleanupPending);
  } });
}
function settle() { return new Promise(resolve => setImmediate(resolve)); }
async function until(condition) {
  if (!condition()) { await settle(); }
  assert(condition(), 'Expected asynchronous checkpoint was not reached');
}
async function scenario(name, f, steps, invariant = () => {}) {
  try {
    for (const step of steps) { await step(); invariant(); }
  } catch (error) {
    error.message = name + ': ' + error.message + ' Trace: ' + f.trace.join(' -> '); throw error;
  }
}
module.exports = { fixture, deferred, until, load, states, settle, scenario, flowEvents };
