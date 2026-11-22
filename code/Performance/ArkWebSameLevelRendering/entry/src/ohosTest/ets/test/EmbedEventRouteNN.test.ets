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

export default function embedEventRouteNN(host: EmbedDocumentHost): void {
  describe('EmbedEventRouteNN', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0001
     * @tc.name testEmbedNotifyEventRoute0001
     * @tc.desc nativeSearch route with bubbles=false and ancestor capture=false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const child = make('span', 'notifyChild', node);
    keep(parent, 'touchstart', watch('parent'), false);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: false, cancelable: true });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      after.join(','),
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
      expect(result[0]).assertEqual('main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,0');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0002
     * @tc.name testEmbedNotifyEventRoute0002
     * @tc.desc nativeSearch route with bubbles=false and ancestor capture=true
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const child = make('span', 'notifyChild', node);
    keep(parent, 'touchstart', watch('parent'), true);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: false, cancelable: true });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      after.join(','),
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
      expect(result[0]).assertEqual('parent,main');
      expect(result[1]).assertEqual('nativeSearch>bodyId,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('1,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,0');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0003
     * @tc.name testEmbedNotifyEventRoute0003
     * @tc.desc nativeSearch route with bubbles=true and ancestor capture=false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const child = make('span', 'notifyChild', node);
    keep(parent, 'touchstart', watch('parent'), false);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      after.join(','),
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
      expect(result[0]).assertEqual('main,parent');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>bodyId');
      expect(result[2]).assertEqual('2,3');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,0');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0004
     * @tc.name testEmbedNotifyEventRoute0004
     * @tc.desc nativeSearch route with bubbles=true and ancestor capture=true
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const child = make('span', 'notifyChild', node);
    keep(parent, 'touchstart', watch('parent'), true);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      after.join(','),
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
      expect(result[0]).assertEqual('parent,main');
      expect(result[1]).assertEqual('nativeSearch>bodyId,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('1,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,0');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0005
     * @tc.name testEmbedNotifyEventRoute0005
     * @tc.desc notifyChild route with bubbles=false and ancestor capture=false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const child = make('span', 'notifyChild', node);
    keep(parent, 'touchstart', watch('parent'), false);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: false, cancelable: true });
    const accepted = child.dispatchEvent(event);
    const after = [event.target === child, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      after.join(','),
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
      expect(result[0]).assertEqual('');
      expect(result[1]).assertEqual('');
      expect(result[2]).assertEqual('');
      expect(result[3]).assertEqual('');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,0');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0006
     * @tc.name testEmbedNotifyEventRoute0006
     * @tc.desc notifyChild route with bubbles=false and ancestor capture=true
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const child = make('span', 'notifyChild', node);
    keep(parent, 'touchstart', watch('parent'), true);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: false, cancelable: true });
    const accepted = child.dispatchEvent(event);
    const after = [event.target === child, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      after.join(','),
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
      expect(result[0]).assertEqual('parent');
      expect(result[1]).assertEqual('notifyChild>bodyId');
      expect(result[2]).assertEqual('1');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,0');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0007
     * @tc.name testEmbedNotifyEventRoute0007
     * @tc.desc notifyChild route with bubbles=true and ancestor capture=false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const child = make('span', 'notifyChild', node);
    keep(parent, 'touchstart', watch('parent'), false);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = child.dispatchEvent(event);
    const after = [event.target === child, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      after.join(','),
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
      expect(result[0]).assertEqual('main,parent');
      expect(result[1]).assertEqual('notifyChild>nativeSearch,notifyChild>bodyId');
      expect(result[2]).assertEqual('3,3');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,0');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0008
     * @tc.name testEmbedNotifyEventRoute0008
     * @tc.desc notifyChild route with bubbles=true and ancestor capture=true
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const child = make('span', 'notifyChild', node);
    keep(parent, 'touchstart', watch('parent'), true);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = child.dispatchEvent(event);
    const after = [event.target === child, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      after.join(','),
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
      expect(result[0]).assertEqual('parent,main');
      expect(result[1]).assertEqual('notifyChild>bodyId,notifyChild>nativeSearch');
      expect(result[2]).assertEqual('1,3');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,0');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0009
     * @tc.name testEmbedNotifyEventRoute0009
     * @tc.desc Dispatch on parent never descends into nativeSearch but positive embed dispatch does
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const created = [];
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
    const sibling = make('div', 'notifySibling', parent);
    const event = new Event('touchstart', { bubbles: true });
    const accepted = parent.dispatchEvent(event);
    const quiet = notices.length;
    const firstTarget = event.target === parent;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(accepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0010
     * @tc.name testEmbedNotifyEventRoute0010
     * @tc.desc Dispatch on sibling never descends into nativeSearch but positive embed dispatch does
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const created = [];
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
    const sibling = make('div', 'notifySibling', parent);
    const event = new Event('touchstart', { bubbles: true });
    const accepted = sibling.dispatchEvent(event);
    const quiet = notices.length;
    const firstTarget = event.target === sibling;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(accepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0011
     * @tc.name testEmbedNotifyEventRoute0011
     * @tc.desc Dispatch on body never descends into nativeSearch but positive embed dispatch does
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const created = [];
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
    const sibling = make('div', 'notifySibling', parent);
    const event = new Event('touchstart', { bubbles: true });
    const accepted = document.body.dispatchEvent(event);
    const quiet = notices.length;
    const firstTarget = event.target === document.body;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(accepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0012
     * @tc.name testEmbedNotifyEventRoute0012
     * @tc.desc Dispatch on document never descends into nativeSearch but positive embed dispatch does
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const created = [];
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
    const sibling = make('div', 'notifySibling', parent);
    const event = new Event('touchstart', { bubbles: true });
