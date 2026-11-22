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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { EmbedDocumentHost } from './EmbedDocumentHost';
import { paceTurn } from './shared/TestPace';

const NOTIFY_STATE: string = `
  const records = window.__embedProbeRegistrations;
  const baseline = records[0];
  const node = nativeEmbed.nativeSearch;
  const original = nativeEmbed.events;
  const parent = node.parentNode;
  const next = node.nextSibling;
  const descriptor = Object.getOwnPropertyDescriptor(original, 'handleEvent');
  const notices = [], routes = [], phases = [], bindings = [];
`;

const NOTIFY_REPORTER: string = `
  const name = target => target === window ? 'window' : (target.id || target.nodeName);
  const notify = (event, label, bound) => {
    notices.push(label);
    routes.push(name(event.target) + '>' + name(event.currentTarget));
    phases.push(event.eventPhase);
    bindings.push(bound);
  };
`;

const NOTIFY_RESTORE: string = `
    records.slice(1).forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
    node.removeEventListener('touchstart', original, false);
    nativeEmbed.events = original;
    nativeEmbed.nativeSearch = node;
    if (descriptor) { Object.defineProperty(original, 'handleEvent', descriptor); }
    else { delete original.handleEvent; }
`;

export default function embedListenerSequenceNN(host: EmbedDocumentHost): void {
  describe('EmbedListenerSequenceNN', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0001
     * @tc.name testEmbedNotifyListenerSequence0001
     * @tc.desc Duplicate init deduplicates original callback
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    nativeEmbed.init();
    fire(node);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === records[2].listener),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0002
     * @tc.name testEmbedNotifyListenerSequence0002
     * @tc.desc Different objects using the same function are distinct registrations
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const shared = function(event) {
      notify(event, this === first ? 'first' : 'second', this === first || this === second);
    };
    const first = { handleEvent: shared };
    const second = { handleEvent: shared };
    nativeEmbed.events = first;
    nativeEmbed.init();
    nativeEmbed.events = second;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener !== records[2].listener),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,first,second');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0003
     * @tc.name testEmbedNotifyListenerSequence0003
     * @tc.desc Replacement followed by repeated init adds one replacement notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const replacement = watch('replacement');
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === records[2].listener),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,replacement');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0004
     * @tc.name testEmbedNotifyListenerSequence0004
     * @tc.desc Returning events to original identity does not add a third listener
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const replacement = watch('replacement');
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    nativeEmbed.events = original;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[2].listener === original),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,replacement');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0005
     * @tc.name testEmbedNotifyListenerSequence0005
     * @tc.desc Removing old identity leaves only replacement notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const replacement = watch('replacement');
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    node.removeEventListener('touchstart', original, false);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === replacement),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('replacement');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
