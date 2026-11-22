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

export default function embedTouchNotifyNN(host: EmbedDocumentHost): void {
  describe('EmbedTouchNotifyNN', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0001
     * @tc.name testEmbedNotifyTouchNotify0001
     * @tc.desc Initial object observes bubbles=false, cancelable=false, composed=false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const flags = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      flags.push(event.bubbles, event.cancelable, event.composed, event.isTrusted);
    };
    const event = new Event('touchstart', { bubbles: false, cancelable: false, composed: false });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), flags.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('false,false,false,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0002
     * @tc.name testEmbedNotifyTouchNotify0002
     * @tc.desc Initial object observes bubbles=false, cancelable=false, composed=true
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const flags = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      flags.push(event.bubbles, event.cancelable, event.composed, event.isTrusted);
    };
    const event = new Event('touchstart', { bubbles: false, cancelable: false, composed: true });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), flags.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('false,false,true,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0003
     * @tc.name testEmbedNotifyTouchNotify0003
     * @tc.desc Initial object observes bubbles=false, cancelable=true, composed=false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const flags = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      flags.push(event.bubbles, event.cancelable, event.composed, event.isTrusted);
    };
    const event = new Event('touchstart', { bubbles: false, cancelable: true, composed: false });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), flags.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('false,true,false,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0004
     * @tc.name testEmbedNotifyTouchNotify0004
     * @tc.desc Initial object observes bubbles=false, cancelable=true, composed=true
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const flags = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      flags.push(event.bubbles, event.cancelable, event.composed, event.isTrusted);
    };
    const event = new Event('touchstart', { bubbles: false, cancelable: true, composed: true });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), flags.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('false,true,true,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0005
     * @tc.name testEmbedNotifyTouchNotify0005
     * @tc.desc Initial object observes bubbles=true, cancelable=false, composed=false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const flags = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      flags.push(event.bubbles, event.cancelable, event.composed, event.isTrusted);
    };
    const event = new Event('touchstart', { bubbles: true, cancelable: false, composed: false });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), flags.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('true,false,false,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0006
     * @tc.name testEmbedNotifyTouchNotify0006
     * @tc.desc Initial object observes bubbles=true, cancelable=false, composed=true
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const flags = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      flags.push(event.bubbles, event.cancelable, event.composed, event.isTrusted);
    };
    const event = new Event('touchstart', { bubbles: true, cancelable: false, composed: true });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), flags.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('true,false,true,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0007
     * @tc.name testEmbedNotifyTouchNotify0007
     * @tc.desc Initial object observes bubbles=true, cancelable=true, composed=false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const flags = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      flags.push(event.bubbles, event.cancelable, event.composed, event.isTrusted);
    };
    const event = new Event('touchstart', { bubbles: true, cancelable: true, composed: false });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), flags.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('true,true,false,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0008
     * @tc.name testEmbedNotifyTouchNotify0008
     * @tc.desc Initial object observes bubbles=true, cancelable=true, composed=true
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const flags = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      flags.push(event.bubbles, event.cancelable, event.composed, event.isTrusted);
    };
    const event = new Event('touchstart', { bubbles: true, cancelable: true, composed: true });
    const accepted = node.dispatchEvent(event);
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), flags.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('true,true,true,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0009
     * @tc.name testEmbedNotifyTouchNotify0009
     * @tc.desc Event named touchstart routes through handleEvent without type filtering
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const payloads = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      payloads.push(event.type + ':' + event.constructor.name);
    };
    const event = new Event('touchstart');
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), payloads.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('touchstart:Event');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0010
     * @tc.name testEmbedNotifyTouchNotify0010
     * @tc.desc UIEvent named touchstart routes through handleEvent without type filtering
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const payloads = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      payloads.push(event.detail + ':' + (event.view === window));
    };
    const event = new UIEvent('touchstart', { view: window, detail: 2 });
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), payloads.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('2:true');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0011
     * @tc.name testEmbedNotifyTouchNotify0011
     * @tc.desc CustomEvent named touchstart routes through handleEvent without type filtering
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const payloads = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      payloads.push(event.detail.source);
    };
    const event = new CustomEvent('touchstart', { detail: { source: 'embed' } });
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), payloads.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('embed');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0012
     * @tc.name testEmbedNotifyTouchNotify0012
     * @tc.desc MouseEvent named touchstart routes through handleEvent without type filtering
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const payloads = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      payloads.push([event.clientX, event.clientY, event.buttons].join(','));
    };
    const event = new MouseEvent('touchstart', { clientX: 17, clientY: 29, buttons: 1 });
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
    const after = [event.target === node, event.currentTarget === null, event.eventPhase];
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), payloads.join(','),
      String(accepted), after.join(','),
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
      expect(result[4]).assertEqual('17,29,1');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,0');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0013
     * @tc.name testEmbedNotifyTouchNotify0013
     * @tc.desc touchmove cannot notify the touchstart registration; positive control still notifies
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const unrelated = new Event('touchmove', { bubbles: true, cancelable: true });
    const firstAccepted = node.dispatchEvent(unrelated);
    const quiet = notices.length;
    const firstTarget = unrelated.target === node;
    const start = new Event('touchstart', { bubbles: true });
    const secondAccepted = node.dispatchEvent(start);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(firstAccepted && secondAccepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0014
     * @tc.name testEmbedNotifyTouchNotify0014
     * @tc.desc touchend cannot notify the touchstart registration; positive control still notifies
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const unrelated = new Event('touchend', { bubbles: true, cancelable: true });
    const firstAccepted = node.dispatchEvent(unrelated);
    const quiet = notices.length;
    const firstTarget = unrelated.target === node;
    const start = new Event('touchstart', { bubbles: true });
    const secondAccepted = node.dispatchEvent(start);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(firstAccepted && secondAccepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0015
     * @tc.name testEmbedNotifyTouchNotify0015
     * @tc.desc touchcancel cannot notify the touchstart registration; positive control still notifies
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const unrelated = new Event('touchcancel', { bubbles: true, cancelable: true });
    const firstAccepted = node.dispatchEvent(unrelated);
    const quiet = notices.length;
    const firstTarget = unrelated.target === node;
    const start = new Event('touchstart', { bubbles: true });
    const secondAccepted = node.dispatchEvent(start);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(firstAccepted && secondAccepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0016
     * @tc.name testEmbedNotifyTouchNotify0016
     * @tc.desc TouchStart cannot notify the touchstart registration; positive control still notifies
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const unrelated = new Event('TouchStart', { bubbles: true, cancelable: true });
    const firstAccepted = node.dispatchEvent(unrelated);
    const quiet = notices.length;
    const firstTarget = unrelated.target === node;
    const start = new Event('touchstart', { bubbles: true });
    const secondAccepted = node.dispatchEvent(start);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(firstAccepted && secondAccepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0017
     * @tc.name testEmbedNotifyTouchNotify0017
     * @tc.desc touchStart cannot notify the touchstart registration; positive control still notifies
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const unrelated = new Event('touchStart', { bubbles: true, cancelable: true });
    const firstAccepted = node.dispatchEvent(unrelated);
    const quiet = notices.length;
    const firstTarget = unrelated.target === node;
    const start = new Event('touchstart', { bubbles: true });
    const secondAccepted = node.dispatchEvent(start);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(firstAccepted && secondAccepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0018
     * @tc.name testEmbedNotifyTouchNotify0018
     * @tc.desc click cannot notify the touchstart registration; positive control still notifies
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const unrelated = new Event('click', { bubbles: true, cancelable: true });
    const firstAccepted = node.dispatchEvent(unrelated);
    const quiet = notices.length;
    const firstTarget = unrelated.target === node;
    const start = new Event('touchstart', { bubbles: true });
    const secondAccepted = node.dispatchEvent(start);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(firstAccepted && secondAccepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0019
     * @tc.name testEmbedNotifyTouchNotify0019
     * @tc.desc pointerdown cannot notify the touchstart registration; positive control still notifies
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const unrelated = new Event('pointerdown', { bubbles: true, cancelable: true });
    const firstAccepted = node.dispatchEvent(unrelated);
    const quiet = notices.length;
    const firstTarget = unrelated.target === node;
    const start = new Event('touchstart', { bubbles: true });
    const secondAccepted = node.dispatchEvent(start);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(firstAccepted && secondAccepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0020
     * @tc.name testEmbedNotifyTouchNotify0020
     * @tc.desc pointerup cannot notify the touchstart registration; positive control still notifies
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const unrelated = new Event('pointerup', { bubbles: true, cancelable: true });
    const firstAccepted = node.dispatchEvent(unrelated);
    const quiet = notices.length;
    const firstTarget = unrelated.target === node;
    const start = new Event('touchstart', { bubbles: true });
    const secondAccepted = node.dispatchEvent(start);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(firstTarget), String(firstAccepted && secondAccepted),
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
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0021
     * @tc.name testEmbedNotifyTouchNotify0021
     * @tc.desc Replacing handleEvent before real init changes notification without replacing listener identity
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'old', this === original); };
    fire(node);
    original.handleEvent = function(event) { notify(event, 'new', this === original); };
    nativeEmbed.init();
    fire(node);
    const identity = records[1].listener === original;
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(identity),
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
      expect(result[0]).assertEqual('old,new');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0022
     * @tc.name testEmbedNotifyTouchNotify0022
     * @tc.desc Replacing handleEvent after real init is resolved at each DOM dispatch
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    original.handleEvent = function(event) { notify(event, 'late', this === original); };
    fire(node);
    const identity = records[1].listener === original;
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(identity),
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
      expect(result[0]).assertEqual('main,late');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0023
     * @tc.name testEmbedNotifyTouchNotify0023
     * @tc.desc HandleEvent getter resolves once per notification and keeps original receiver
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const lookups = [];
    Object.defineProperty(original, 'handleEvent', {
      configurable: true,
      get() {
        lookups.push(this === original);
        return function(event) { notify(event, 'getter', this === original); };
      }
    });
    nativeEmbed.init();
    fire(node);
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), lookups.join(','),
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
      expect(result[0]).assertEqual('getter,getter');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true,true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0024
     * @tc.name testEmbedNotifyTouchNotify0024
     * @tc.desc Getter can select a different handleEvent function on the next notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    let mode = 'first';
    Object.defineProperty(original, 'handleEvent', {
      configurable: true,
      get() {
        const label = mode;
        return function(event) { notify(event, label, this === original); };
      }
    });
    fire(node);
    mode = 'second';
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
      expect(result[0]).assertEqual('first,second');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0025
     * @tc.name testEmbedNotifyTouchNotify0025
     * @tc.desc Inherited handleEvent is used by real init for a replacement observer
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const prototype = { handleEvent(event) { notify(event, 'inherited', this === replacement); } };
    const replacement = Object.create(prototype);
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    fire(node);
    const inherited = !Object.prototype.hasOwnProperty.call(replacement, 'handleEvent');
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(inherited),
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
      expect(result[0]).assertEqual('main,inherited');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0026
     * @tc.name testEmbedNotifyTouchNotify0026
     * @tc.desc Own handleEvent shadows inherited observer method without adding a listener
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const prototype = { handleEvent(event) { notify(event, 'prototype', this === replacement); } };
    const replacement = Object.create(prototype);
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    fire(node);
    replacement.handleEvent = function(event) { notify(event, 'own', this === replacement); };
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
      expect(result[0]).assertEqual('main,prototype,main,own');
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
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0027
     * @tc.name testEmbedNotifyTouchNotify0027
     * @tc.desc Deleting own handleEvent exposes an inherited observer without an empty-object dispatch error
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const prototype = { handleEvent(event) { notify(event, 'fallback', this === replacement); } };
    const replacement = Object.create(prototype);
    replacement.handleEvent = function(event) { notify(event, 'own', this === replacement); };
    nativeEmbed.events = replacement;
    nativeEmbed.init();
    fire(node);
    delete replacement.handleEvent;
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
      expect(result[0]).assertEqual('main,own,main,fallback');
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
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0028
     * @tc.name testEmbedNotifyTouchNotify0028
     * @tc.desc Changing events without real init leaves only the original registered observer active
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    fire(node);
    const beforeInit = notices.join(',');
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), beforeInit,
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
      expect(result[0]).assertEqual('main,main,replacement');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2,2');
      expect(result[3]).assertEqual('true,true,true');
      expect(result[4]).assertEqual('main');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0029
     * @tc.name testEmbedNotifyTouchNotify0029
     * @tc.desc Non-enumerable handleEvent still receives real touchstart notifications
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    Object.defineProperty(original, 'handleEvent', {
      configurable: true,
      enumerable: false,
      value: function(event) { notify(event, 'hidden', this === original); }
    });
    nativeEmbed.init();
    fire(node);
    const enumerable = Object.prototype.propertyIsEnumerable.call(original, 'handleEvent');
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(enumerable),
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
      expect(result[0]).assertEqual('hidden');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0030
     * @tc.name testEmbedNotifyTouchNotify0030
     * @tc.desc HandleEvent may be swapped by its own callback for the following notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) {
      notify(event, 'first', this === original);
      original.handleEvent = function(nextEvent) { notify(nextEvent, 'second', this === original); };
    };
    fire(node);
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
      expect(result[0]).assertEqual('first,second');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0031
     * @tc.name testEmbedNotifyTouchNotify0031
     * @tc.desc Main non-passive registration preventDefault with cancelable=false
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const defaults = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      defaults.push(event.defaultPrevented);
      event.preventDefault();
      defaults.push(event.defaultPrevented);
    };
    nativeEmbed.init();
    const event = new Event('touchstart', { cancelable: false });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), defaults.join(','),
      String(accepted), String(event.defaultPrevented),
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
      expect(result[4]).assertEqual('false,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('false');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0032
     * @tc.name testEmbedNotifyTouchNotify0032
     * @tc.desc Main non-passive registration preventDefault with cancelable=true
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const defaults = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      defaults.push(event.defaultPrevented);
      event.preventDefault();
      defaults.push(event.defaultPrevented);
    };
    nativeEmbed.init();
    const event = new Event('touchstart', { cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), defaults.join(','),
      String(accepted), String(event.defaultPrevented),
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
      expect(result[4]).assertEqual('false,true');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0033
     * @tc.name testEmbedNotifyTouchNotify0033
     * @tc.desc Returning false from object handleEvent does not cancel dispatch
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      return false;
    };
    nativeEmbed.init();
    const event = new Event('touchstart', { cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      String(event.defaultPrevented),
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
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0034
     * @tc.name testEmbedNotifyTouchNotify0034
     * @tc.desc An already canceled event still notifies the initial object
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const defaults = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      defaults.push(event.defaultPrevented);
    };
    const event = new Event('touchstart', { cancelable: true });
    event.preventDefault();
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), defaults.join(','),
      String(accepted),
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
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0035
     * @tc.name testEmbedNotifyTouchNotify0035
     * @tc.desc CancelBubble set by main callback stops ancestors but not same-target observer
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const sibling = watch('peer');
    keep(node, 'touchstart', sibling, false);
    keep(parent, 'touchstart', watch('parent'), false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.cancelBubble = true;
    };
    const event = new Event('touchstart', { bubbles: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      String(event.cancelBubble),
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
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0036
     * @tc.name testEmbedNotifyTouchNotify0036
     * @tc.desc stopPropagation in main permits later observer on same target
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    keep(node, 'touchstart', watch('peer'), false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.stopPropagation();
    };
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
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
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0037
     * @tc.name testEmbedNotifyTouchNotify0037
     * @tc.desc stopImmediatePropagation suppresses later same-target notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    keep(node, 'touchstart', watch('peer'), false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.stopImmediatePropagation();
    };
    const event = new Event('touchstart', { bubbles: true, cancelable: true });
    const accepted = node.dispatchEvent(event);
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
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0038
     * @tc.name testEmbedNotifyTouchNotify0038
     * @tc.desc PreventDefault does not suppress a later same-target notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    const peerDefaults = [];
    keep(node, 'touchstart', watch('peer', event => peerDefaults.push(event.defaultPrevented)), false);
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.preventDefault();
    };
    const event = new Event('touchstart', { cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), peerDefaults.join(','),
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
      expect(result[0]).assertEqual('main,peer');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0039
     * @tc.name testEmbedNotifyTouchNotify0039
     * @tc.desc ReturnValue false from main cancels a cancelable notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.returnValue = false;
    };
    nativeEmbed.init();
    const event = new Event('touchstart', { cancelable: true });
    const accepted = node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(accepted),
      String(event.defaultPrevented),
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
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0040
     * @tc.name testEmbedNotifyTouchNotify0040
     * @tc.desc Clearing returnValue cannot undo a prior main preventDefault
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const defaults = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.preventDefault();
      event.returnValue = true;
      defaults.push(event.defaultPrevented);
    };
    const event = new Event('touchstart', { cancelable: true });
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), defaults.join(','),
      String(accepted),
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
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0041
     * @tc.name testEmbedNotifyTouchNotify0041
     * @tc.desc Reusing a completed event notifies twice and clears currentTarget after each dispatch
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const event = new Event('touchstart', { bubbles: true });
    const results = [];
    results.push(node.dispatchEvent(event));
    results.push(event.currentTarget === null, event.eventPhase === 0);
    nativeEmbed.init();
    results.push(node.dispatchEvent(event));
    results.push(event.currentTarget === null, event.eventPhase === 0);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), results.join(','),
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
      expect(result[4]).assertEqual('true,true,true,true,true,true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0042
     * @tc.name testEmbedNotifyTouchNotify0042
     * @tc.desc Reusing a canceled event preserves defaultPrevented for the next notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const defaults = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      defaults.push(event.defaultPrevented);
      event.preventDefault();
    };
    const event = new Event('touchstart', { cancelable: true });
    const first = node.dispatchEvent(event);
    const second = node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), defaults.join(','),
      String(first || second),
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
      expect(result[4]).assertEqual('false,true');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0043
     * @tc.name testEmbedNotifyTouchNotify0043
     * @tc.desc Completed event can change target to a sibling without notifying the embed again
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const sibling = make('div', 'notifySibling', parent);
    const event = new Event('touchstart', { bubbles: true });
    node.dispatchEvent(event);
    const initialTarget = event.target === node;
    sibling.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(initialTarget),
      String(event.target === sibling), String(event.currentTarget === null),
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
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0044
     * @tc.name testEmbedNotifyTouchNotify0044
     * @tc.desc Dispatching the same active event is rejected without a second notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const errors = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      try { node.dispatchEvent(event); } catch (error) { errors.push(error.name); }
    };
    const event = new Event('touchstart');
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), errors.join(','),
      String(accepted),
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
      expect(result[4]).assertEqual('InvalidStateError');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0045
     * @tc.name testEmbedNotifyTouchNotify0045
     * @tc.desc Nested distinct events retain the outer callback currentTarget and phase
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    const states = [];
    let nested = false;
    original.handleEvent = function(event) {
      notify(event, nested ? 'inner' : 'outer', this === original);
      if (!nested) {
        nested = true;
        fire(node);
        states.push(event.target === node, event.currentTarget === node, event.eventPhase);
      }
    };
    fire(node);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), states.join(','),
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
      expect(result[0]).assertEqual('outer,inner');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true,true,2');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0046
     * @tc.name testEmbedNotifyTouchNotify0046
     * @tc.desc ComposedPath during main notification contains embed and parent and empties after dispatch
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const paths = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      const path = event.composedPath();
      paths.push(path[0] === node, path[1] === parent, path[path.length - 1] === window);
    };
    const event = new Event('touchstart', { bubbles: true });
    node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), paths.join(','),
      String(event.composedPath().length),
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
      expect(result[4]).assertEqual('true,true,true');
      expect(result[5]).assertEqual('0');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0047
     * @tc.name testEmbedNotifyTouchNotify0047
     * @tc.desc Detached dispatch has a one-node composedPath and preserves the cached target
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const paths = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      paths.push(event.composedPath().length, event.composedPath()[0] === node, node.isConnected);
    };
    node.remove();
    nativeEmbed.init();
    const event = new Event('touchstart', { bubbles: true });
    node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), paths.join(','),
      String(event.target === node),
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
      expect(result[4]).assertEqual('1,true,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0048
     * @tc.name testEmbedNotifyTouchNotify0048
     * @tc.desc Reinserted cached target resumes connected notification after detached notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    const connected = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      connected.push(node.isConnected);
    };
    node.remove();
    fire(node);
    parent.insertBefore(node, next);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), connected.join(','),
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
      expect(result[4]).assertEqual('false,true');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0049
     * @tc.name testEmbedNotifyTouchNotify0049
     * @tc.desc An id change does not redirect the existing observer or real init cached reference
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  let extras = [];
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const previousId = node.id;
    try {
      node.id = 'renamedEmbed';
      nativeEmbed.init();
      fire(node);
      const missing = document.getElementById('nativeSearch') === null;
      node.id = previousId;
      fire(node);
      extras = [String(missing), String(baseline.target === node)];
    } finally {
      node.id = previousId;
    }
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), extras[0], extras[1],
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
      expect(result[1]).assertEqual('renamedEmbed>renamedEmbed,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('1');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0050
     * @tc.name testEmbedNotifyTouchNotify0050
     * @tc.desc Cloning the embed does not clone its native touchstart listener
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
  const created = [];
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const clone = node.cloneNode(false);
    clone.id = 'notifyClone';
    created.push(clone);
    parent.appendChild(clone);
    fire(clone);
    const quiet = notices.length;
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
      String(clone !== node),
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
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0051
     * @tc.name testEmbedNotifyTouchNotify0051
     * @tc.desc Reinitializing a completed event to touchmove removes its eligibility for main notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const event = new Event('touchstart', { bubbles: true });
    node.dispatchEvent(event);
    event.initEvent('touchmove', true, true);
    const quietBefore = notices.length;
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','),
      String(notices.length === quietBefore), event.type, String(accepted),
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
      expect(result[5]).assertEqual('touchmove');
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0052
     * @tc.name testEmbedNotifyTouchNotify0052
     * @tc.desc Reinitializing touchend to touchstart makes the completed event eligible for notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) { notify(event, 'main', this === original); };
    const event = new Event('touchend');
    node.dispatchEvent(event);
    const quiet = notices.length;
    event.initEvent('touchstart', true, true);
    nativeEmbed.init();
    node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet), event.type,
      String(event.bubbles && event.cancelable),
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
      expect(result[5]).assertEqual('touchstart');
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0053
     * @tc.name testEmbedNotifyTouchNotify0053
     * @tc.desc InitEvent clears prior cancellation before the next main notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const defaults = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      defaults.push(event.defaultPrevented);
    };
    const event = new Event('touchstart', { cancelable: true });
    event.preventDefault();
    const first = node.dispatchEvent(event);
    event.initEvent('touchstart', true, true);
    const second = node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), defaults.join(','),
      String(first), String(second),
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
      expect(result[4]).assertEqual('true,false');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0054
     * @tc.name testEmbedNotifyTouchNotify0054
     * @tc.desc CustomEvent detail mutations are observed by the same registered object on redispatch
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const values = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      values.push(event.detail.status);
    };
    const detail = { status: 'pending' };
    const event = new CustomEvent('touchstart', { detail });
    node.dispatchEvent(event);
    detail.status = 'ready';
    nativeEmbed.init();
    node.dispatchEvent(event);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), values.join(','),
      String(event.detail === detail),
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
      expect(result[4]).assertEqual('pending,ready');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0055
     * @tc.name testEmbedNotifyTouchNotify0055
     * @tc.desc Callback stores event reference but currentTarget is cleared outside synchronous notification
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    let stored = null;
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      stored = event;
    };
    const event = new Event('touchstart');
    node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(stored === event),
      String(stored.currentTarget === null), String(stored.target === node),
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
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0056
     * @tc.name testEmbedNotifyTouchNotify0056
     * @tc.desc Two distinct events retain their own target and canceled state after notifications
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      if (event.cancelable) { event.preventDefault(); }
    };
    const canceled = new Event('touchstart', { cancelable: true });
    const regular = new Event('touchstart');
    const first = node.dispatchEvent(canceled);
    const second = node.dispatchEvent(regular);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(first), String(second),
      [canceled.defaultPrevented, regular.defaultPrevented].join(','),
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
      expect(result[4]).assertEqual('false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,false');
      expect(result[7]).assertEqual('true,true,true,true,true,true');
      expect(result[8]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0057
     * @tc.name testEmbedNotifyTouchNotify0057
     * @tc.desc Callback compares dispatched event by identity rather than matching only event type
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  const fire = (target, type = 'touchstart', options = { bubbles: true, cancelable: true }) =>
    target.dispatchEvent(new Event(type, options));
  try {
    const event = new Event('touchstart');
    const identities = [];
    original.handleEvent = function(received) {
      notify(received, 'main', this === original);
      identities.push(received === event);
    };
    node.dispatchEvent(event);
    nativeEmbed.init();
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), identities.join(','),
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
      expect(result[4]).assertEqual('true,false');
      expect(result[5]).assertEqual('true,true,true,true,true,true');
      expect(result[6]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0058
     * @tc.name testEmbedNotifyTouchNotify0058
     * @tc.desc Main can inspect UIEvent detail zero without losing default notification flags
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`
(() => {
${NOTIFY_STATE}
${NOTIFY_REPORTER}
  try {
    const details = [];
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      details.push(event.detail, event.view === null, event.bubbles, event.cancelable);
    };
    const event = new UIEvent('touchstart');
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), details.join(','),
      String(accepted),
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
      expect(result[4]).assertEqual('0,true,false,false');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0059
     * @tc.name testEmbedNotifyTouchNotify0059
     * @tc.desc Passive peer cannot undo cancellation performed by main non-passive observer
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    keep(node, 'touchstart', watch('passive', event => {
      event.preventDefault();
      defaults.push(event.defaultPrevented);
    }), { passive: true });
    original.handleEvent = function(event) {
      notify(event, 'main', this === original);
      event.preventDefault();
    };
    const event = new Event('touchstart', { cancelable: true });
    const accepted = node.dispatchEvent(event);
    nativeEmbed.init();
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
      expect(result[0]).assertEqual('main,passive');
      expect(result[1]).assertEqual('nativeSearch>nativeSearch,nativeSearch>nativeSearch');
      expect(result[2]).assertEqual('2,2');
      expect(result[3]).assertEqual('true,true');
      expect(result[4]).assertEqual('true');
      expect(result[5]).assertEqual('false');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('3');
    });

    /**
     * @tc.number ARKWEB_EMBED_NOTIFY_TOUCHNOTIFY_0060
     * @tc.name testEmbedNotifyTouchNotify0060
     * @tc.desc A removed main listener sees no touch types until real init restores touchstart only
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNotifyTouchNotify0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
    fire(node, 'touchmove');
    fire(node, 'touchend');
    const quiet = notices.length;
    nativeEmbed.init();
    fire(node, 'touchmove');
    fire(node, 'touchend');
    fire(node);
    return JSON.stringify([
      notices.join(','), routes.join(','), phases.join(','), bindings.join(','), String(quiet),
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
      expect(result[4]).assertEqual('0');
      expect(result[5]).assertEqual('true');
      expect(result[6]).assertEqual('true,true,true,true,true,true');
      expect(result[7]).assertEqual('2');
    });
  });
}
