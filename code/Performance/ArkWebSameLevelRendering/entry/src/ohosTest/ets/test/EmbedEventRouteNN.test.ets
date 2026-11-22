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
    const accepted = document.dispatchEvent(event);
    const quiet = notices.length;
    const firstTarget = event.target === document;
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
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0013
     * @tc.name testEmbedNotifyEventRoute0013
     * @tc.desc Ancestor capture stopPropagation prevents notification on the embedded target
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(parent, 'touchstart', watch('capture', event => { event.stopPropagation(); }), true);
    keep(parent, 'touchstart', watch('peer'), true);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      String(event.target === node),
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
      expect(result[0]).assertEqual('capture,peer');
      expect(result[1]).assertEqual('nativeSearch>bodyId,nativeSearch>bodyId');
      expect(result[2]).assertEqual('1,1');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0014
     * @tc.name testEmbedNotifyEventRoute0014
     * @tc.desc Ancestor capture stopImmediatePropagation prevents notification on the embedded target
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(parent, 'touchstart', watch('capture', event => { event.stopImmediatePropagation(); }), true);
    keep(parent, 'touchstart', watch('peer'), true);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      String(event.target === node),
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
      expect(result[0]).assertEqual('capture');
      expect(result[1]).assertEqual('nativeSearch>bodyId');
      expect(result[2]).assertEqual('1');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0015
     * @tc.name testEmbedNotifyEventRoute0015
     * @tc.desc Ancestor capture cancelBubble prevents notification on the embedded target
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(parent, 'touchstart', watch('capture', event => { event.cancelBubble = true; }), true);
    keep(parent, 'touchstart', watch('peer'), true);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      String(event.target === node),
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
      expect(result[0]).assertEqual('capture,peer');
      expect(result[1]).assertEqual('nativeSearch>bodyId,nativeSearch>bodyId');
      expect(result[2]).assertEqual('1,1');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0016
     * @tc.name testEmbedNotifyEventRoute0016
     * @tc.desc Target capture stopPropagation prevents main target bubble notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', watch('capture', event => event.stopPropagation()), true);
    keep(node, 'touchstart', watch('capturePeer'), true);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true });
    node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(event.currentTarget === null),
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
      expect(result[0]).assertEqual('capture,capturePeer');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('4');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0017
     * @tc.name testEmbedNotifyEventRoute0017
     * @tc.desc Target capture stopImmediatePropagation prevents main target bubble notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    keep(node, 'touchstart', watch('capture', event => event.stopImmediatePropagation()), true);
    keep(node, 'touchstart', watch('capturePeer'), true);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true });
    node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(event.currentTarget === null),
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
      expect(result[0]).assertEqual('capture');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('4');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0018
     * @tc.name testEmbedNotifyEventRoute0018
     * @tc.desc Child target stopPropagation suppresses nativeSearch bubble observer
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const child = make('span', 'notifyChild', node);
    keep(child, 'touchstart', watch('child', event => event.stopPropagation()), false);
    nativeEmbed.init();
    fire(child);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(child.parentNode === node),
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
      expect(result[0]).assertEqual('child');
      expect(result[1]).assertEqual('notifyChild>notifyChild');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0019
     * @tc.name testEmbedNotifyEventRoute0019
     * @tc.desc Main stopPropagation permits same-currentTarget peer but suppresses parent bubbling
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const child = make('span', 'notifyChild', node);
    keep(node, 'touchstart', watch('peer'), false);
    keep(parent, 'touchstart', watch('parent'), false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.stopPropagation();
    };
    fire(child);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(child.isConnected),
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
      expect(result[0]).assertEqual('main,peer');
      expect(result[1]).assertEqual('notifyChild>nativeSearch,notifyChild>nativeSearch');
      expect(result[2]).assertEqual('3,3');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0020
     * @tc.name testEmbedNotifyEventRoute0020
     * @tc.desc Main stopImmediatePropagation suppresses peer and parent on child route
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const child = make('span', 'notifyChild', node);
    keep(node, 'touchstart', watch('peer'), false);
    keep(parent, 'touchstart', watch('parent'), false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.stopImmediatePropagation();
    };
    fire(child);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(child.isConnected),
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
      expect(result[1]).assertEqual('notifyChild>nativeSearch');
      expect(result[2]).assertEqual('3');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0021
     * @tc.name testEmbedNotifyEventRoute0021
     * @tc.desc Ancestor preventDefault notifies main with canceled state and false dispatch result
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    const defaults = [];
    keep(parent, 'touchstart', watch('capture', event => event.preventDefault()), true);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      defaults.push(event.defaultPrevented);
    };
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), defaults.join(','),
      String(accepted),
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
      expect(result[1]).assertEqual('nativeSearch>bodyId,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('1,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0022
     * @tc.name testEmbedNotifyEventRoute0022
     * @tc.desc Main cancellation is visible to the bubbling ancestor without changing route
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    const defaults = [];
    keep(parent, 'touchstart', watch('parent', event => defaults.push(event.defaultPrevented)), false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.preventDefault();
    };
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), defaults.join(','),
      String(accepted),
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
      expect(result[0]).assertEqual('main,parent');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>bodyId');
      expect(result[2]).assertEqual('2,3');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0023
     * @tc.name testEmbedNotifyEventRoute0023
     * @tc.desc Passive ancestor cannot cancel the event seen by main
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    const defaults = [];
    keep(parent, 'touchstart', watch('capture', event => event.preventDefault()), { capture: true, passive: true });
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      defaults.push(event.defaultPrevented);
    };
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), defaults.join(','),
      String(accepted),
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
      expect(result[1]).assertEqual('nativeSearch>bodyId,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('1,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0024
     * @tc.name testEmbedNotifyEventRoute0024
     * @tc.desc Noncancelable child event reaches main and ancestors despite preventDefault attempts
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    keep(child, 'touchstart', watch('child', event => event.preventDefault()), false);
    keep(parent, 'touchstart', watch('parent'), false);
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true, cancelable: false });
    const accepted = child.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      String(event.defaultPrevented),
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
      expect(result[0]).assertEqual('child,main,parent');
      expect(result[1]).assertEqual('notifyChild>notifyChild,notifyChild>nativeSearch,notifyChild>bodyId');
      expect(result[2]).assertEqual('2,3,3');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0025
     * @tc.name testEmbedNotifyEventRoute0025
     * @tc.desc Full document capture and bubble route brackets main target notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    keep(document, 'touchstart', watch('documentCapture'), true);
    keep(parent, 'touchstart', watch('parentCapture'), true);
    keep(parent, 'touchstart', watch('parentBubble'), false);
    keep(document, 'touchstart', watch('documentBubble'), false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
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
      expect(result[0]).assertEqual('documentCapture,parentCapture,main,parentBubble,documentBubble');
      expect(result[1]).assertEqual(
        'nativeSearch>#document,nativeSearch>bodyId,nativeSearch>nativeSearch,nativeSearc' +
        'h>bodyId,nativeSearch>#document'
      );
      expect(result[2]).assertEqual('1,1,2,3,3');
      expect(result[3]).assertEqual('true,true,true,true,true');
      expect(result[4]).assertEqual('true,true,true,true,true,true');
      expect(result[5]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0026
     * @tc.name testEmbedNotifyEventRoute0026
     * @tc.desc Window capture and bubble observe main target with stable event target
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    keep(window, 'touchstart', watch('windowCapture'), true);
    keep(window, 'touchstart', watch('windowBubble'), false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
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
      expect(result[0]).assertEqual('windowCapture,main,windowBubble');
      expect(result[1]).assertEqual('nativeSearch>window,nativeSearch>nativeSearch,nativeSearch>window');
      expect(result[2]).assertEqual('1,2,3');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true,true,true,true,true,true');
      expect(result[5]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0027
     * @tc.name testEmbedNotifyEventRoute0027
     * @tc.desc Grandchild route uses grandchild target and embedded bubble currentTarget
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const child = make('span', 'notifyChild', node);
    const grandchild = make('i', 'notifyGrandchild', child);
    keep(child, 'touchstart', watch('child'), false);
    keep(parent, 'touchstart', watch('parent'), false);
    nativeEmbed.init();
    fire(grandchild);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
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
      expect(result[0]).assertEqual('child,main,parent');
      expect(result[1]).assertEqual(
        'notifyGrandchild>notifyChild,notifyGrandchild>nativeSearch,notifyGrandchild>body' +
        'Id'
      );
      expect(result[2]).assertEqual('3,3,3');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true,true,true,true,true,true');
      expect(result[5]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0028
     * @tc.name testEmbedNotifyEventRoute0028
     * @tc.desc Nonbubbling grandchild still traverses ancestor capture but not main bubble
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const child = make('span', 'notifyChild', node);
    const grandchild = make('i', 'notifyGrandchild', child);
    keep(node, 'touchstart', watch('embedCapture'), true);
    keep(parent, 'touchstart', watch('parentCapture'), true);
    nativeEmbed.init();
    fire(grandchild, 'touchstart', { bubbles: false });
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
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
      expect(result[0]).assertEqual('parentCapture,embedCapture');
      expect(result[1]).assertEqual('notifyGrandchild>bodyId,notifyGrandchild>nativeSearch');
      expect(result[2]).assertEqual('1,1');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true,true,true,true,true,true');
      expect(result[5]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0029
     * @tc.name testEmbedNotifyEventRoute0029
     * @tc.desc Detached embed loses document route but keeps target observer and child bubbling
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const child = make('span', 'notifyChild', node);
    keep(parent, 'touchstart', watch('parent'), false);
    node.remove();
    nativeEmbed.init();
    fire(child);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(node.isConnected),
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
      expect(result[1]).assertEqual('notifyChild>nativeSearch');
      expect(result[2]).assertEqual('3');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0030
     * @tc.name testEmbedNotifyEventRoute0030
     * @tc.desc Reinsert restores parent bubbling after detached embed target notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    keep(parent, 'touchstart', watch('parent'), false);
    node.remove();
    fire(node);
    parent.insertBefore(node, next);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
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
      expect(result[0]).assertEqual('main,main,parent');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>bodyId');
      expect(result[2]).assertEqual('2,2,3');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('true,true,true,true,true,true');
      expect(result[5]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0031
     * @tc.name testEmbedNotifyEventRoute0031
     * @tc.desc Reparent changes ancestor currentTarget while main remains the cached target
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const alternate = make('section', 'notifyAlternate', document.body);
    keep(parent, 'touchstart', watch('oldParent'), false);
    keep(alternate, 'touchstart', watch('newParent'), false);
    alternate.appendChild(node);
    nativeEmbed.init();
    fire(node);
    parent.insertBefore(node, next);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
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
      expect(result[0]).assertEqual('main,newParent,main,oldParent');
      expect(result[1]).assertEqual(
        'nativeSearch>nativeSearch,nativeSearch>notifyAlternate,nativeSearch>nativeSearch' +
        ',nativeSearch>bodyId'
      );
      expect(result[2]).assertEqual('2,3,2,3');
      expect(result[3]).assertEqual('true,true,true,true');
      expect(result[4]).assertEqual('true,true,true,true,true,true');
      expect(result[5]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0032
     * @tc.name testEmbedNotifyEventRoute0032
     * @tc.desc Fragment ancestry is reflected in currentTarget without document propagation
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const fragment = document.createDocumentFragment();
    keep(fragment, 'touchstart', watch('fragment'), false);
    keep(parent, 'touchstart', watch('parent'), false);
    fragment.appendChild(node);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(node.isConnected),
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
      expect(result[0]).assertEqual('main,fragment');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>#document-fragment');
      expect(result[2]).assertEqual('2,3');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0033
     * @tc.name testEmbedNotifyEventRoute0033
     * @tc.desc Detachment during parent capture does not change the precomputed dispatch route
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    keep(parent, 'touchstart', watch('capture', () => node.remove()), true);
    keep(parent, 'touchstart', watch('bubble'), false);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(node.isConnected),
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
      expect(result[0]).assertEqual('capture,main,bubble');
      expect(result[1]).assertEqual('nativeSearch>bodyId,nativeSearch>nativeSearch,nativeSearch>bodyId');
      expect(result[2]).assertEqual('1,2,3');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0034
     * @tc.name testEmbedNotifyEventRoute0034
     * @tc.desc Detachment during main callback retains old parent notification for active dispatch only
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    keep(parent, 'touchstart', watch('parent'), false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      node.remove();
    };
    fire(node);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(node.isConnected),
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
      expect(result[0]).assertEqual('main,parent,main');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>bodyId,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,3,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0035
     * @tc.name testEmbedNotifyEventRoute0035
     * @tc.desc Reparent in capture does not add new ancestors to an already active route
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const alternate = make('section', 'notifyAlternate', document.body);
    keep(parent, 'touchstart', watch('capture', () => alternate.appendChild(node)), true);
    keep(parent, 'touchstart', watch('oldBubble'), false);
    keep(alternate, 'touchstart', watch('newBubble'), false);
    fire(node);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
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
      expect(result[0]).assertEqual('capture,main,oldBubble,main,newBubble');
      expect(result[1]).assertEqual(
        'nativeSearch>bodyId,nativeSearch>nativeSearch,nativeSearch>bodyId,nativeSearch>n' +
        'ativeSearch,nativeSearch>notifyAlternate'
      );
      expect(result[2]).assertEqual('1,2,3,2,3');
      expect(result[3]).assertEqual('true,true,true,true,true');
      expect(result[4]).assertEqual('true,true,true,true,true,true');
      expect(result[5]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0036
     * @tc.name testEmbedNotifyEventRoute0036
     * @tc.desc Removing child during target callback does not erase main bubble route
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const child = make('span', 'notifyChild', node);
    keep(child, 'touchstart', watch('child', () => child.remove()), false);
    nativeEmbed.init();
    fire(child);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(child.isConnected),
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
      expect(result[0]).assertEqual('child,main');
      expect(result[1]).assertEqual('notifyChild>notifyChild,notifyChild>nativeSearch');
      expect(result[2]).assertEqual('2,3');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0037
     * @tc.name testEmbedNotifyEventRoute0037
     * @tc.desc Removing parent bubble observer during main suppresses that active route notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const ancestor = watch('parent');
    keep(parent, 'touchstart', ancestor, false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      parent.removeEventListener('touchstart', ancestor, false);
    };
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
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_EVENTROUTE_0038
     * @tc.name testEmbedNotifyEventRoute0038
     * @tc.desc Adding parent bubble observer during main is visible in later ancestor phase
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyEventRoute0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    let installed = false;
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      if (!installed) {
        installed = true;
        keep(parent, 'touchstart', watch('lateParent'), false);
      }
    };
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
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
