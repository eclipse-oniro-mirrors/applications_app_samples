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
