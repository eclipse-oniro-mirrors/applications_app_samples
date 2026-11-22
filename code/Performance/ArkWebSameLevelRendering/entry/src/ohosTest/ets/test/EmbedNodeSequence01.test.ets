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
