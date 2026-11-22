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

export default function embedNodeSequence01(host: EmbedDocumentHost): void {
  describe('EmbedNodeSequence01', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0001
     * @tc.name testEmbedNode0001
     * @tc.desc Rename the queried node, then transfer the exact id back: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          target.id = 'renamedNode';
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 229px; height: 109px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.id = 'retiredNode'; target.id = 'nativeSearch';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('173,71');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('229,109');
      expect(result[6]).assertEqual('229,109');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0002
     * @tc.name testEmbedNode0002
     * @tc.desc Rename the queried node, then transfer the exact id back: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          target.id = 'renamedNode';
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 229px; height: 109px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.id = 'retiredNode'; target.id = 'nativeSearch';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('141,57');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('229,109');
      expect(result[6]).assertEqual('229,109');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0003
     * @tc.name testEmbedNode0003
     * @tc.desc Rename the queried node, then transfer the exact id back: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          target.id = 'renamedNode';
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 229px; height: 109px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.id = 'retiredNode'; target.id = 'nativeSearch';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('211,97');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('229,109');
      expect(result[6]).assertEqual('229,109');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0004
     * @tc.name testEmbedNode0004
     * @tc.desc Rename the queried node, then transfer the exact id back: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          target.id = 'renamedNode';
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 229px; height: 109px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.id = 'retiredNode'; target.id = 'nativeSearch';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('83,137');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('229,109');
      expect(result[6]).assertEqual('229,109');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0005
     * @tc.name testEmbedNode0005
     * @tc.desc Remove the current node, query a span successor, then reinsert the old node first: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          target.remove();
          const candidate = document.createElement('span'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 157px; height: 89px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('173,71');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('157,89');
      expect(result[6]).assertEqual('157,89');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0006
     * @tc.name testEmbedNode0006
     * @tc.desc Remove the current node, query a span successor, then reinsert the old node first: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          target.remove();
          const candidate = document.createElement('span'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 157px; height: 89px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('141,57');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('157,89');
      expect(result[6]).assertEqual('157,89');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0007
     * @tc.name testEmbedNode0007
     * @tc.desc Remove the current node, query a span successor, then reinsert the old node first: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          target.remove();
          const candidate = document.createElement('span'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 157px; height: 89px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('211,97');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('157,89');
      expect(result[6]).assertEqual('157,89');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0008
     * @tc.name testEmbedNode0008
     * @tc.desc Remove the current node, query a span successor, then reinsert the old node first: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          target.remove();
          const candidate = document.createElement('span'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 157px; height: 89px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('83,137');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('157,89');
      expect(result[6]).assertEqual('157,89');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0009
     * @tc.name testEmbedNode0009
     * @tc.desc Replace the current child with a div, then replace the div with the prior child: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pendingNode';
          candidate.style.cssText = 'display: block; width: 247px; height: 53px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.replaceChild(target, candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('173,71');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('247,53');
      expect(result[6]).assertEqual('247,53');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0010
     * @tc.name testEmbedNode0010
     * @tc.desc Replace the current child with a div, then replace the div with the prior child: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pendingNode';
          candidate.style.cssText = 'display: block; width: 247px; height: 53px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.replaceChild(target, candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('141,57');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('247,53');
      expect(result[6]).assertEqual('247,53');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0011
     * @tc.name testEmbedNode0011
     * @tc.desc Replace the current child with a div, then replace the div with the prior child: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pendingNode';
          candidate.style.cssText = 'display: block; width: 247px; height: 53px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.replaceChild(target, candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('211,97');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('247,53');
      expect(result[6]).assertEqual('247,53');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0012
     * @tc.name testEmbedNode0012
     * @tc.desc Replace the current child with a div, then replace the div with the prior child: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pendingNode';
          candidate.style.cssText = 'display: block; width: 247px; height: 53px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.replaceChild(target, candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('83,137');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('247,53');
      expect(result[6]).assertEqual('247,53');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0013
     * @tc.name testEmbedNode0013
     * @tc.desc ReplaceWith a span, then resize the detached predecessor without changing the live query: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'pendingNode';
          candidate.style.cssText = 'display: block; width: 191px; height: 127px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.cssText = 'display: block; width: 313px; height: 151px; padding: 0; border: 0;';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(document.contains(original)), String(original.offsetWidth + ',' + original.offsetHeight)
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('191,127');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('191,127');
      expect(result[6]).assertEqual('191,127');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('false');
      expect(result[10]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0014
     * @tc.name testEmbedNode0014
     * @tc.desc ReplaceWith a span, then resize the detached predecessor without changing the live query: live padded
     * div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'pendingNode';
          candidate.style.cssText = 'display: block; width: 191px; height: 127px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.cssText = 'display: block; width: 313px; height: 151px; padding: 0; border: 0;';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('191,127');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('191,127');
      expect(result[6]).assertEqual('191,127');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0015
     * @tc.name testEmbedNode0015
     * @tc.desc ReplaceWith a span, then resize the detached predecessor without changing the live query: live
     * border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'pendingNode';
          candidate.style.cssText = 'display: block; width: 191px; height: 127px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.cssText = 'display: block; width: 313px; height: 151px; padding: 0; border: 0;';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('191,127');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('191,127');
      expect(result[6]).assertEqual('191,127');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0016
     * @tc.name testEmbedNode0016
     * @tc.desc ReplaceWith a span, then resize the detached predecessor without changing the live query: live
     * replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'pendingNode';
          candidate.style.cssText = 'display: block; width: 191px; height: 127px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.cssText = 'display: block; width: 313px; height: 151px; padding: 0; border: 0;';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('191,127');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('191,127');
      expect(result[6]).assertEqual('191,127');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0017
     * @tc.name testEmbedNode0017
     * @tc.desc Shallow-clone replacement gains its own box, then the predecessor is restored: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(false);
          candidate.style.cssText = 'display: block; width: 263px; height: 79px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild === null && target.firstElementChild === marker;
          stage.replaceChild(target, candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('173,71');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('263,79');
      expect(result[6]).assertEqual('263,79');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0018
     * @tc.name testEmbedNode0018
     * @tc.desc Shallow-clone replacement gains its own box, then the predecessor is restored: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(false);
          candidate.style.cssText = 'display: block; width: 263px; height: 79px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild === null && target.firstElementChild === marker;
          stage.replaceChild(target, candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('141,57');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('263,79');
      expect(result[6]).assertEqual('263,79');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0019
     * @tc.name testEmbedNode0019
     * @tc.desc Shallow-clone replacement gains its own box, then the predecessor is restored: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(false);
          candidate.style.cssText = 'display: block; width: 263px; height: 79px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild === null && target.firstElementChild === marker;
          stage.replaceChild(target, candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('211,97');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('263,79');
      expect(result[6]).assertEqual('263,79');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0020
     * @tc.name testEmbedNode0020
     * @tc.desc Shallow-clone replacement gains its own box, then the predecessor is restored: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(false);
          candidate.style.cssText = 'display: block; width: 263px; height: 79px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild === null && target.firstElementChild === marker;
          stage.replaceChild(target, candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('83,137');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('263,79');
      expect(result[6]).assertEqual('263,79');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0021
     * @tc.name testEmbedNode0021
     * @tc.desc Deep-clone replacement remains current after the detached original is renamed: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(true);
          candidate.style.cssText = 'display: block; width: 181px; height: 143px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild !== marker &&
            secondNode.firstElementChild.textContent === 'retained child';
          target.id = 'detachedPredecessor';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence), String(document.contains(original)),
            String(original.offsetWidth + ',' + original.offsetHeight)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('181,143');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('181,143');
      expect(result[6]).assertEqual('181,143');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
      expect(result[10]).assertEqual('false');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0022
     * @tc.name testEmbedNode0022
     * @tc.desc Deep-clone replacement remains current after the detached original is renamed: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(true);
          candidate.style.cssText = 'display: block; width: 181px; height: 143px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild !== marker &&
            secondNode.firstElementChild.textContent === 'retained child';
          target.id = 'detachedPredecessor';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('181,143');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('181,143');
      expect(result[6]).assertEqual('181,143');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0023
     * @tc.name testEmbedNode0023
     * @tc.desc Deep-clone replacement remains current after the detached original is renamed: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(true);
          candidate.style.cssText = 'display: block; width: 181px; height: 143px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild !== marker &&
            secondNode.firstElementChild.textContent === 'retained child';
          target.id = 'detachedPredecessor';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('181,143');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('181,143');
      expect(result[6]).assertEqual('181,143');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0024
     * @tc.name testEmbedNode0024
     * @tc.desc Deep-clone replacement remains current after the detached original is renamed: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(true);
          candidate.style.cssText = 'display: block; width: 181px; height: 143px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild !== marker &&
            secondNode.firstElementChild.textContent === 'retained child';
          target.id = 'detachedPredecessor';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('181,143');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('181,143');
      expect(result[6]).assertEqual('181,143');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0025
     * @tc.name testEmbedNode0025
     * @tc.desc Move the queried node into a nested ancestor, then across to the side container: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const nested = document.createElement('section'); stage.appendChild(nested);
          nested.appendChild(target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('173,71');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('173,71');
      expect(result[6]).assertEqual('173,71');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0026
     * @tc.name testEmbedNode0026
     * @tc.desc Move the queried node into a nested ancestor, then across to the side container: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const nested = document.createElement('section'); stage.appendChild(nested);
          nested.appendChild(target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('141,57');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('141,57');
      expect(result[6]).assertEqual('141,57');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0027
     * @tc.name testEmbedNode0027
     * @tc.desc Move the queried node into a nested ancestor, then across to the side container: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const nested = document.createElement('section'); stage.appendChild(nested);
          nested.appendChild(target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('211,97');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('211,97');
      expect(result[6]).assertEqual('211,97');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0028
     * @tc.name testEmbedNode0028
     * @tc.desc Move the queried node into a nested ancestor, then across to the side container: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const nested = document.createElement('section'); stage.appendChild(nested);
          nested.appendChild(target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('83,137');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('83,137');
      expect(result[6]).assertEqual('83,137');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0029
     * @tc.name testEmbedNode0029
     * @tc.desc Insert an earlier duplicate and move it later to promote the original queried node: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 277px; height: 61px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('173,71');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('277,61');
      expect(result[6]).assertEqual('277,61');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0030
     * @tc.name testEmbedNode0030
     * @tc.desc Insert an earlier duplicate and move it later to promote the original queried node: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 277px; height: 61px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('141,57');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('277,61');
      expect(result[6]).assertEqual('277,61');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0031
     * @tc.name testEmbedNode0031
     * @tc.desc Insert an earlier duplicate and move it later to promote the original queried node: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 277px; height: 61px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('211,97');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('277,61');
      expect(result[6]).assertEqual('277,61');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0032
     * @tc.name testEmbedNode0032
     * @tc.desc Insert an earlier duplicate and move it later to promote the original queried node: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 277px; height: 61px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(candidate);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
