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
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0006
     * @tc.name testEmbedNotifyListenerSequence0006
     * @tc.desc Removing replacement identity leaves original notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    node.removeEventListener('touchstart', replacement, false);
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0007
     * @tc.name testEmbedNotifyListenerSequence0007
     * @tc.desc Function callback is registered by real init with DOM target receiver
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const callback = function(event) { notify(event, 'function', this === node); };
    nativeEmbed.events = callback;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === callback),
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
      expect(result[0]).assertEqual('main,function');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0008
     * @tc.name testEmbedNotifyListenerSequence0008
     * @tc.desc Bound function identity differs from original unbound function
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const owner = {};
    const callback = function(event) {
      notify(event, this === owner ? 'bound' : 'plain', this === owner || this === node);
    };
    const bound = callback.bind(owner);
    nativeEmbed.events = callback;
    nativeEmbed.init();
    nativeEmbed.events = bound;
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
      expect(result[0]).assertEqual('main,plain,bound');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0009
     * @tc.name testEmbedNotifyListenerSequence0009
     * @tc.desc Separate bound functions from one method retain distinct callback identities
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const owner = {};
    const callback = function(event) { notify(event, 'bound', this === owner); };
    const first = callback.bind(owner);
    const second = callback.bind(owner);
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
      expect(result[0]).assertEqual('main,bound,bound');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0010
     * @tc.name testEmbedNotifyListenerSequence0010
     * @tc.desc Removing method function cannot remove its owning observer object
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.removeEventListener('touchstart', original.handleEvent, false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === original),
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0011
     * @tc.name testEmbedNotifyListenerSequence0011
     * @tc.desc Removal using an equal-shaped new observer cannot remove original identity
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const equalShape = { handleEvent: original.handleEvent };
    node.removeEventListener('touchstart', equalShape, false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(equalShape.handleEvent === original.handleEvent),
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0012
     * @tc.name testEmbedNotifyListenerSequence0012
     * @tc.desc A frozen replacement observer can still be registered and deduplicated
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const replacement = Object.freeze(watch('frozen'));
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(Object.isFrozen(replacement)),
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
      expect(result[0]).assertEqual('main,frozen');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0013
     * @tc.name testEmbedNotifyListenerSequence0013
     * @tc.desc Capture identity is distinct from main bubble identity on the same target
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', original, true);
    nativeEmbed.init();
    fire(node);
    const captures = records.slice(1).map(record => String(record.options));
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), captures.join(','),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
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
      expect(result[4]).assertEqual('true,false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0014
     * @tc.name testEmbedNotifyListenerSequence0014
     * @tc.desc Removing with capture true leaves the real bubble registration intact
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', original, true);
    node.removeEventListener('touchstart', original, true);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(records[2].options),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0015
     * @tc.name testEmbedNotifyListenerSequence0015
     * @tc.desc Removing with capture false leaves only capture until init rearms bubble
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', original, true);
    node.removeEventListener('touchstart', original, false);
    fire(node);
    const firstCount = notices.length;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(firstCount),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,main,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('1');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0016
     * @tc.name testEmbedNotifyListenerSequence0016
     * @tc.desc RemoveListener with omitted disarms main until real init rearm
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.removeEventListener('touchstart', original, undefined);
    fire(node);
    const quiet = notices.length;
    nativeEmbed.init();
    fire(node);
    const registered = records[1];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(registered.listener === original),
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('0');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0017
     * @tc.name testEmbedNotifyListenerSequence0017
     * @tc.desc RemoveListener with boolean false disarms main until real init rearm
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.removeEventListener('touchstart', original, false);
    fire(node);
    const quiet = notices.length;
    nativeEmbed.init();
    fire(node);
    const registered = records[1];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(registered.listener === original),
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('0');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0018
     * @tc.name testEmbedNotifyListenerSequence0018
     * @tc.desc RemoveListener with capture false object disarms main until real init rearm
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.removeEventListener('touchstart', original, { capture: false });
    fire(node);
    const quiet = notices.length;
    nativeEmbed.init();
    fire(node);
    const registered = records[1];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(registered.listener === original),
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('0');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0019
     * @tc.name testEmbedNotifyListenerSequence0019
     * @tc.desc RemoveListener ignores once and passive when matching capture false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.removeEventListener('touchstart', original, { capture: false, once: true, passive: true });
    fire(node);
    const quiet = notices.length;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(records[1].options),
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('0');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0020
     * @tc.name testEmbedNotifyListenerSequence0020
     * @tc.desc Once registration before real init is not upgraded to persistent by duplicate init
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.removeEventListener('touchstart', original, false);
    keep(node, 'touchstart', original, { once: true });
    nativeEmbed.init();
    fire(node);
    fire(node);
    const consumedCount = notices.length;
    nativeEmbed.init();
    fire(node);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(consumedCount),
      String(records[2].options),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,main,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('1');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('4');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0021
     * @tc.name testEmbedNotifyListenerSequence0021
     * @tc.desc Adding once true after baseline cannot change its persistent registration
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', original, { once: true });
    fire(node);
    fire(node);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].options.once),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
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
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0022
     * @tc.name testEmbedNotifyListenerSequence0022
     * @tc.desc Passive true before init remains passive until remove and real rearm
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  try {
    node.removeEventListener('touchstart', original, false);
    keep(node, 'touchstart', original, { passive: true });
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.preventDefault();
    };
    nativeEmbed.init();
    const passiveEvent = new Event('touchstart', { cancelable: true });
    const first = node.dispatchEvent(passiveEvent);
    node.removeEventListener('touchstart', original, false);
    nativeEmbed.init();
    const activeEvent = new Event('touchstart', { cancelable: true });
    const second = node.dispatchEvent(activeEvent);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(first), String(second),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
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
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('4');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0023
     * @tc.name testEmbedNotifyListenerSequence0023
     * @tc.desc Aborted preexisting signal listener is absent and real init rearms it
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.removeEventListener('touchstart', original, false);
    const controller = new AbortController();
    keep(node, 'touchstart', original, { signal: controller.signal });
    nativeEmbed.init();
    controller.abort();
    fire(node);
    const quiet = notices.length;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(controller.signal.aborted),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('0');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('4');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0024
     * @tc.name testEmbedNotifyListenerSequence0024
     * @tc.desc Mutating options capture does not mutate registration but changes removal matching
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const observer = watch('capture');
    const options = { capture: true };
    keep(node, 'touchstart', observer, options);
    options.capture = false;
    node.removeEventListener('touchstart', observer, options);
    fire(node);
    node.removeEventListener('touchstart', observer, true);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === observer),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('capture,main,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0025
     * @tc.name testEmbedNotifyListenerSequence0025
     * @tc.desc Main self-removal takes effect on the next dispatch then real init restores
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      node.removeEventListener('touchstart', original, false);
    };
    fire(node);
    fire(node);
    const removedCount = notices.length;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(removedCount),
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
      expect(result[4]).assertEqual('1');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0026
     * @tc.name testEmbedNotifyListenerSequence0026
     * @tc.desc Self-removal followed by init in callback does not repeat current-phase notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      node.removeEventListener('touchstart', original, false);
      nativeEmbed.init();
    };
    fire(node);
    const firstCount = notices.length;
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(firstCount),
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
      expect(result[4]).assertEqual('1');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0027
     * @tc.name testEmbedNotifyListenerSequence0027
     * @tc.desc Real init inside callback appends replacement only for following target dispatch
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const replacement = watch('replacement');
    let installed = false;
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      if (!installed) {
        installed = true;
        nativeEmbed.events = replacement;
        nativeEmbed.init();
      }
    };
    fire(node);
    const firstCount = notices.length;
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(firstCount),
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
      expect(result[0]).assertEqual('main,main,replacement');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('1');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0028
     * @tc.name testEmbedNotifyListenerSequence0028
     * @tc.desc Removing a later observer from main skips its current dispatch notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    const later = watch('later');
    keep(node, 'touchstart', later, false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      node.removeEventListener('touchstart', later, false);
    };
    fire(node);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === later),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
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
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0029
     * @tc.name testEmbedNotifyListenerSequence0029
     * @tc.desc Replacing a later observer method changes that same dispatch notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    const later = watch('old');
    keep(node, 'touchstart', later, false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      later.handleEvent = function(nextEvent) { notify(nextEvent, 'updated', this === later); };
    };
    fire(node);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === later),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,updated');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0030
     * @tc.name testEmbedNotifyListenerSequence0030
     * @tc.desc Removing and readding later observer skips it now and moves it to following dispatch
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    const later = watch('later');
    keep(node, 'touchstart', later, false);
    let changed = false;
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      if (!changed) {
        changed = true;
        node.removeEventListener('touchstart', later, false);
        keep(node, 'touchstart', later, false);
      }
    };
    fire(node);
    const firstCount = notices.length;
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(firstCount),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,main,later');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('1');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0031
     * @tc.name testEmbedNotifyListenerSequence0031
     * @tc.desc Main aborts a later signal observer before its current dispatch turn
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    const controller = new AbortController();
    const later = watch('later');
    keep(node, 'touchstart', later, { signal: controller.signal });
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      controller.abort();
    };
    fire(node);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(controller.signal.aborted),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
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
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0032
     * @tc.name testEmbedNotifyListenerSequence0032
     * @tc.desc Once main callback rearmed by real init survives after once has been consumed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    node.removeEventListener('touchstart', original, false);
    keep(node, 'touchstart', original, { once: true });
    let rearmed = false;
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      if (!rearmed) { rearmed = true; nativeEmbed.init(); }
    };
    fire(node);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(records[2].options),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
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
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0033
     * @tc.name testEmbedNotifyListenerSequence0033
     * @tc.desc Nested dispatch sees replacement installed by outer main while outer snapshot does not
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const replacement = watch('replacement');
    let nested = false;
    original.handleEvent = function(event) {
      notify(event, nested ? 'inner' : 'outer', this === original);
      if (!nested) {
        nested = true;
        nativeEmbed.events = replacement;
        nativeEmbed.init();
        fire(node);
      }
    };
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
      expect(result[0]).assertEqual('outer,inner,replacement');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0034
     * @tc.name testEmbedNotifyListenerSequence0034
     * @tc.desc Capture callback real init can install bubble main for the same target dispatch
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.removeEventListener('touchstart', original, false);
    keep(node, 'touchstart', watch('capture', () => nativeEmbed.init()), true);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[2].listener === original),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('capture,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0035
     * @tc.name testEmbedNotifyListenerSequence0035
     * @tc.desc Capture callback removal of bubble main suppresses current dispatch until rearm
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', watch('capture', () => {
      node.removeEventListener('touchstart', original, false);
    }), true);
    fire(node);
    const firstCount = notices.length;
    node.removeEventListener('touchstart', records[1].listener, true);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(firstCount),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('capture,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('1');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0036
     * @tc.name testEmbedNotifyListenerSequence0036
     * @tc.desc Dispatch type mutation via initEvent during callback is ignored for active notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const types = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.initEvent('touchmove', false, false);
      types.push(event.type, event.bubbles, event.cancelable);
    };
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), types.join(','),
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('touchstart,true,true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0037
     * @tc.name testEmbedNotifyListenerSequence0037
     * @tc.desc Peer added after main with capture=false follows phase and insertion order
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const peer = watch('peer');
    keep(node, 'touchstart', peer, false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === peer),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,peer');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0038
     * @tc.name testEmbedNotifyListenerSequence0038
     * @tc.desc Peer added after main with capture=true follows phase and insertion order
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const peer = watch('peer');
    keep(node, 'touchstart', peer, true);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === peer),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('peer,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0039
     * @tc.name testEmbedNotifyListenerSequence0039
     * @tc.desc Peer added before main with capture=false follows phase and insertion order
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const peer = watch('peer');
    node.removeEventListener('touchstart', original, false);
    keep(node, 'touchstart', peer, false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === peer),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('peer,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0040
     * @tc.name testEmbedNotifyListenerSequence0040
     * @tc.desc Peer added before main with capture=true follows phase and insertion order
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const peer = watch('peer');
    node.removeEventListener('touchstart', original, false);
    keep(node, 'touchstart', peer, true);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === peer),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('peer,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0041
     * @tc.name testEmbedNotifyListenerSequence0041
     * @tc.desc Removing main and real init rearm moves main after an existing bubble peer
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const peer = watch('peer');
    keep(node, 'touchstart', peer, false);
    fire(node);
    node.removeEventListener('touchstart', original, false);
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
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,peer,peer,main');
      expect(result[1]).assertEqual(
        'nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch,na' +
        'tiveSearch>nativeSearch'
      );
      expect(result[2]).assertEqual('2,2,2,2');
      expect(result[3]).assertEqual('true,true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0042
     * @tc.name testEmbedNotifyListenerSequence0042
     * @tc.desc Duplicate init preserves insertion order relative to bubble peers
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const first = watch('first');
    const second = watch('second');
    keep(node, 'touchstart', first, false);
    nativeEmbed.init();
    keep(node, 'touchstart', second, false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[2].listener === records[4].listener),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
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
      expect(result[6]).assertEqual('5');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0043
     * @tc.name testEmbedNotifyListenerSequence0043
     * @tc.desc Replacement object is appended after an existing bubble peer
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const peer = watch('peer');
    const replacement = watch('replacement');
    keep(node, 'touchstart', peer, false);
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[2].listener === replacement),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,peer,replacement');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0044
     * @tc.name testEmbedNotifyListenerSequence0044
     * @tc.desc Replacement removal and real rearm moves it after a later peer
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const replacement = watch('replacement');
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    keep(node, 'touchstart', watch('peer'), false);
    fire(node);
    node.removeEventListener('touchstart', replacement, false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === records[3].listener),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,replacement,peer,main,peer,replacement');
      expect(result[1]).assertEqual(
        'nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch,na' +
        'tiveSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch'
      );
      expect(result[2]).assertEqual('2,2,2,2,2,2');
      expect(result[3]).assertEqual('true,true,true,true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('4');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0045
     * @tc.name testEmbedNotifyListenerSequence0045
     * @tc.desc Capture listeners run in capture insertion order even when registered after main bubble
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', watch('capture1'), true);
    keep(node, 'touchstart', watch('capture2'), true);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[3].listener === original),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('capture1,capture2,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('4');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0046
     * @tc.name testEmbedNotifyListenerSequence0046
     * @tc.desc Capture readd moves capture observer after a later capture observer
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const first = watch('first');
    keep(node, 'touchstart', first, true);
    keep(node, 'touchstart', watch('second'), true);
    node.removeEventListener('touchstart', first, true);
    keep(node, 'touchstart', first, true);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === records[3].listener),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('second,first,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('5');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0047
     * @tc.name testEmbedNotifyListenerSequence0047
     * @tc.desc Same observer capture and bubble calls bracket another observer bubble call after rearm
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', original, true);
    keep(node, 'touchstart', watch('peer'), false);
    node.removeEventListener('touchstart', original, false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].listener === records[3].listener),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,peer,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('4');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0048
     * @tc.name testEmbedNotifyListenerSequence0048
     * @tc.desc Once peer consumed between dispatches leaves main notification order intact
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', watch('once'), { once: true });
    keep(node, 'touchstart', watch('last'), false);
    fire(node);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[3].listener === original),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,once,last,main,last');
      expect(result[1]).assertEqual(
        'nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch,na' +
        'tiveSearch>nativeSearch,nativeSearch>nativeSearch'
      );
      expect(result[2]).assertEqual('2,2,2,2,2');
      expect(result[3]).assertEqual('true,true,true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('4');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0049
     * @tc.name testEmbedNotifyListenerSequence0049
     * @tc.desc Removing main while detached leaves no notification until real init rearm
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.remove();
    node.removeEventListener('touchstart', original, false);
    fire(node);
    const quiet = notices.length;
    nativeEmbed.init();
    fire(node);
    parent.insertBefore(node, next);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(node.isConnected),
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
      expect(result[4]).assertEqual('0');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0050
     * @tc.name testEmbedNotifyListenerSequence0050
     * @tc.desc Replacement observer registered while detached is active after reinsert
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    node.remove();
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    fire(node);
    parent.insertBefore(node, next);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].target === node),
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
      expect(result[0]).assertEqual('main,replacement,main,replacement');
      expect(result[1]).assertEqual(
        'nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch,na' +
        'tiveSearch>nativeSearch'
      );
      expect(result[2]).assertEqual('2,2,2,2');
      expect(result[3]).assertEqual('true,true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0051
     * @tc.name testEmbedNotifyListenerSequence0051
     * @tc.desc Same-id replacement stays quiet while init registers cached detached original
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const created = [];
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const replacement = node.cloneNode(false);
    created.push(replacement);
    parent.replaceChild(replacement, node);
    nativeEmbed.init();
    fire(replacement);
    const quiet = notices.length;
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(document.getElementById('nativeSearch') === replacement),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    created.reverse().forEach(element => element.remove());
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('0');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0052
     * @tc.name testEmbedNotifyListenerSequence0052
     * @tc.desc Removing callback on same-id replacement cannot disarm cached original
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const created = [];
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const replacement = node.cloneNode(false);
    created.push(replacement);
    parent.replaceChild(replacement, node);
    replacement.removeEventListener('touchstart', original, false);
    nativeEmbed.init();
    fire(node);
    fire(replacement);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].target === node),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    created.reverse().forEach(element => element.remove());
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0053
     * @tc.name testEmbedNotifyListenerSequence0053
     * @tc.desc Listener manually placed on same-id replacement remains a distinct target registration
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [], created = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const replacement = node.cloneNode(false);
    created.push(replacement);
    parent.replaceChild(replacement, node);
    keep(replacement, 'touchstart', original, false);
    nativeEmbed.init();
    fire(replacement);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].target === replacement), String(records[2].target === node),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    created.reverse().forEach(element => element.remove());
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
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0054
     * @tc.name testEmbedNotifyListenerSequence0054
     * @tc.desc Reinsert original after removing its listener still needs real init rearm
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    node.removeEventListener('touchstart', original, false);
    node.remove();
    parent.insertBefore(node, next);
    fire(node);
    const quiet = notices.length;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(node.parentNode === parent),
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('0');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0055
     * @tc.name testEmbedNotifyListenerSequence0055
     * @tc.desc Reparenting original preserves its original and replacement callback order
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const created = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const make = (tag, id, target) => {
    const element = document.createElement(tag);
    element.id = id;
    created.push(element);
    target.appendChild(element);
    return element;
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const container = make('section', 'notifyContainer', parent);
    const replacement = watch('replacement');
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    container.appendChild(node);
    fire(node);
    parent.insertBefore(node, next);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].target === node),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    created.reverse().forEach(element => element.remove());
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,replacement,main,replacement');
      expect(result[1]).assertEqual(
        'nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch,na' +
        'tiveSearch>nativeSearch'
      );
      expect(result[2]).assertEqual('2,2,2,2');
      expect(result[3]).assertEqual('true,true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0056
     * @tc.name testEmbedNotifyListenerSequence0056
     * @tc.desc Moving original into a fragment preserves listener and duplicate init deduplication
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const fragment = document.createDocumentFragment();
    fragment.appendChild(node);
    nativeEmbed.init();
    fire(node);
    const disconnected = !node.isConnected;
    parent.insertBefore(node, next);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(disconnected),
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
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0057
     * @tc.name testEmbedNotifyListenerSequence0057
     * @tc.desc Init on an explicitly changed cached target does not remove old target listener
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [], created = [];
${NOTIFY_REPORTER}
  const make = (tag, id, target) => {
    const element = document.createElement(tag);
    element.id = id;
    created.push(element);
    target.appendChild(element);
    return element;
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const other = make('div', 'notifyOther', parent);
    nativeEmbed.nativeSearch = other;
    cleanup.push({ target: other, type: 'touchstart', listener: original, options: false });
    nativeEmbed.init();
    fire(other);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(other !== records[0].target),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    created.reverse().forEach(element => element.remove());
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,main');
      expect(result[1]).assertEqual('notifyOther>notifyOther,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,false');
      expect(result[6]).assertEqual('1');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0058
     * @tc.name testEmbedNotifyListenerSequence0058
     * @tc.desc Returning cached target to original after retarget init deduplicates original listener
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [], created = [];
${NOTIFY_REPORTER}
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const make = (tag, id, target) => {
    const element = document.createElement(tag);
    element.id = id;
    created.push(element);
    target.appendChild(element);
    return element;
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const other = make('div', 'notifyOther', parent);
    nativeEmbed.nativeSearch = other;
    keep(other, 'touchstart', original, false);
    nativeEmbed.init();
    nativeEmbed.nativeSearch = node;
    nativeEmbed.init();
    fire(node);
    fire(other);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[1].target === node),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    created.reverse().forEach(element => element.remove());
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,notifyOther>notifyOther');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0059
     * @tc.name testEmbedNotifyListenerSequence0059
     * @tc.desc Retargeted replacement events identity remains independent of original node baseline
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [], created = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const make = (tag, id, target) => {
    const element = document.createElement(tag);
    element.id = id;
    created.push(element);
    target.appendChild(element);
    return element;
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const other = make('div', 'notifyOther', parent);
    const replacement = watch('replacement');
    nativeEmbed.nativeSearch = other;
    nativeEmbed.events = replacement;
    keep(other, 'touchstart', replacement, false);
    nativeEmbed.init();
    fire(other);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(nativeEmbed.events === replacement),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    created.reverse().forEach(element => element.remove());
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('replacement,main');
      expect(result[1]).assertEqual('notifyOther>notifyOther,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,false');
      expect(result[6]).assertEqual('1');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_LISTENERSEQUENCE_0060
     * @tc.name testEmbedNotifyListenerSequence0060
     * @tc.desc Detaching and reattaching does not reset a consumed once observer but real init can rearm it
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyListenerSequence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const cleanup = [];
${NOTIFY_REPORTER}
  const watch = (label, action) => {
    const listener = { handleEvent(event) {
      notify(event, label, this === listener);
      if (action) { action(event, listener); }
    } };
    return listener;
  };
  const keep = (target, type, listener, options) => {
    const capture = typeof options === 'boolean' ? options : !!(options && options.capture);
    cleanup.push({ target, type, listener, options: capture });
    target.addEventListener(type, listener, options);
  };
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const replacement = watch('once');
    keep(node, 'touchstart', replacement, { once: true });
    fire(node);
    node.remove();
    parent.insertBefore(node, next);
    fire(node);
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(records[2].listener === replacement),
      [records[0] === baseline, baseline.target === node, baseline.listener === original,
        baseline.type === 'touchstart', baseline.options === false, nativeEmbed.nativeSearch === node].join(','),
      String(records.length)
    ]);
  } finally {
    cleanup.reverse().forEach(item =>
      item.target.removeEventListener(item.type, item.listener, item.options));
${NOTIFY_RESTORE}
    if (node.parentNode !== parent) { parent.insertBefore(node, next); }
    node.addEventListener('touchstart', original, false);
    records.splice(1);
  }
})()
      `)) as string[];
      expect(result[0]).assertEqual('main,once,main,main,once');
      expect(result[1]).assertEqual(
        'nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch,na' +
        'tiveSearch>nativeSearch,nativeSearch>nativeSearch'
      );
      expect(result[2]).assertEqual('2,2,2,2,2');
      expect(result[3]).assertEqual('true,true,true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('3');
    });
  });
}
