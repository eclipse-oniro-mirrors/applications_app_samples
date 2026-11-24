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

export default function embedQueryGuard02(host: EmbedDocumentHost): void {
  describe('EmbedQueryGuard02', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0037
     * @tc.name testEmbedQuery0037
     * @tc.desc A matching data-id attribute is not an id: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        const savedExtra = original.getAttribute('data-id');
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          target.removeAttribute('id'); target.setAttribute('data-id', 'nativeSearch');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.getAttribute('data-id') === 'nativeSearch';
          target.id = 'nativeSearch';
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
          if (savedExtra === null) { original.removeAttribute('data-id'); }
          else { original.setAttribute('data-id', savedExtra); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('173,71');
      expect(result[9]).assertEqual('173,71');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0038
     * @tc.name testEmbedQuery0038
     * @tc.desc A matching data-id attribute is not an id: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id'); target.setAttribute('data-id', 'nativeSearch');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.getAttribute('data-id') === 'nativeSearch';
          target.id = 'nativeSearch';
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('141,57');
      expect(result[9]).assertEqual('141,57');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0039
     * @tc.name testEmbedQuery0039
     * @tc.desc A matching data-id attribute is not an id: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id'); target.setAttribute('data-id', 'nativeSearch');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.getAttribute('data-id') === 'nativeSearch';
          target.id = 'nativeSearch';
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('211,97');
      expect(result[9]).assertEqual('211,97');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0040
     * @tc.name testEmbedQuery0040
     * @tc.desc A matching data-id attribute is not an id: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id'); target.setAttribute('data-id', 'nativeSearch');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.getAttribute('data-id') === 'nativeSearch';
          target.id = 'nativeSearch';
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('83,137');
      expect(result[9]).assertEqual('83,137');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0041
     * @tc.name testEmbedQuery0041
     * @tc.desc A removed node is absent until reinserted: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = !target.isConnected;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('173,71');
      expect(result[9]).assertEqual('173,71');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0042
     * @tc.name testEmbedQuery0042
     * @tc.desc A removed node is absent until reinserted: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = !target.isConnected;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('141,57');
      expect(result[9]).assertEqual('141,57');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0043
     * @tc.name testEmbedQuery0043
     * @tc.desc A removed node is absent until reinserted: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = !target.isConnected;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('211,97');
      expect(result[9]).assertEqual('211,97');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0044
     * @tc.name testEmbedQuery0044
     * @tc.desc A removed node is absent until reinserted: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = !target.isConnected;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('83,137');
      expect(result[9]).assertEqual('83,137');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0045
     * @tc.name testEmbedQuery0045
     * @tc.desc Fragment contents do not participate in document id lookup: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const fragment = document.createDocumentFragment(); fragment.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = fragment.querySelector('#nativeSearch') === target;
          stage.appendChild(fragment);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('173,71');
      expect(result[9]).assertEqual('173,71');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0046
     * @tc.name testEmbedQuery0046
     * @tc.desc Fragment contents do not participate in document id lookup: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const fragment = document.createDocumentFragment(); fragment.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = fragment.querySelector('#nativeSearch') === target;
          stage.appendChild(fragment);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('141,57');
      expect(result[9]).assertEqual('141,57');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0047
     * @tc.name testEmbedQuery0047
     * @tc.desc Fragment contents do not participate in document id lookup: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const fragment = document.createDocumentFragment(); fragment.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = fragment.querySelector('#nativeSearch') === target;
          stage.appendChild(fragment);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('211,97');
      expect(result[9]).assertEqual('211,97');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0048
     * @tc.name testEmbedQuery0048
     * @tc.desc Fragment contents do not participate in document id lookup: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const fragment = document.createDocumentFragment(); fragment.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = fragment.querySelector('#nativeSearch') === target;
          stage.appendChild(fragment);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('83,137');
      expect(result[9]).assertEqual('83,137');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0049
     * @tc.name testEmbedQuery0049
     * @tc.desc Removing the ancestor makes its descendant unavailable to the business lookup: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.remove();
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = stage.querySelector('#nativeSearch') === target;
          parent.insertBefore(stage, side);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('173,71');
      expect(result[9]).assertEqual('173,71');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0050
     * @tc.name testEmbedQuery0050
     * @tc.desc Removing the ancestor makes its descendant unavailable to the business lookup: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.remove();
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = stage.querySelector('#nativeSearch') === target;
          parent.insertBefore(stage, side);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('141,57');
      expect(result[9]).assertEqual('141,57');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0051
     * @tc.name testEmbedQuery0051
     * @tc.desc Removing the ancestor makes its descendant unavailable to the business lookup: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.remove();
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = stage.querySelector('#nativeSearch') === target;
          parent.insertBefore(stage, side);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('211,97');
      expect(result[9]).assertEqual('211,97');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0052
     * @tc.name testEmbedQuery0052
     * @tc.desc Removing the ancestor makes its descendant unavailable to the business lookup: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.remove();
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = stage.querySelector('#nativeSearch') === target;
          parent.insertBefore(stage, side);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('83,137');
      expect(result[9]).assertEqual('83,137');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0053
     * @tc.name testEmbedQuery0053
     * @tc.desc Replacing a queried element with text creates a recoverable absence: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const placeholder = document.createTextNode('nativeSearch'); target.replaceWith(placeholder);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = placeholder.parentNode === stage;
          placeholder.replaceWith(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('173,71');
      expect(result[9]).assertEqual('173,71');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0054
     * @tc.name testEmbedQuery0054
     * @tc.desc Replacing a queried element with text creates a recoverable absence: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const placeholder = document.createTextNode('nativeSearch'); target.replaceWith(placeholder);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = placeholder.parentNode === stage;
          placeholder.replaceWith(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('141,57');
      expect(result[9]).assertEqual('141,57');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0055
     * @tc.name testEmbedQuery0055
     * @tc.desc Replacing a queried element with text creates a recoverable absence: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const placeholder = document.createTextNode('nativeSearch'); target.replaceWith(placeholder);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = placeholder.parentNode === stage;
          placeholder.replaceWith(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('211,97');
      expect(result[9]).assertEqual('211,97');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0056
     * @tc.name testEmbedQuery0056
     * @tc.desc Replacing a queried element with text creates a recoverable absence: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const placeholder = document.createTextNode('nativeSearch'); target.replaceWith(placeholder);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = placeholder.parentNode === stage;
          placeholder.replaceWith(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('83,137');
      expect(result[9]).assertEqual('83,137');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0057
     * @tc.name testEmbedQuery0057
     * @tc.desc A differently named replacement cannot supply the requested id: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const substitute = target.cloneNode(false); substitute.id = 'replacementSearch';
          stage.replaceChild(substitute, target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('replacementSearch') === substitute;
          stage.replaceChild(target, substitute);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('173,71');
      expect(result[9]).assertEqual('173,71');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0058
     * @tc.name testEmbedQuery0058
     * @tc.desc A differently named replacement cannot supply the requested id: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const substitute = target.cloneNode(false); substitute.id = 'replacementSearch';
          stage.replaceChild(substitute, target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('replacementSearch') === substitute;
          stage.replaceChild(target, substitute);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('141,57');
      expect(result[9]).assertEqual('141,57');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0059
     * @tc.name testEmbedQuery0059
     * @tc.desc A differently named replacement cannot supply the requested id: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const substitute = target.cloneNode(false); substitute.id = 'replacementSearch';
          stage.replaceChild(substitute, target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('replacementSearch') === substitute;
          stage.replaceChild(target, substitute);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('211,97');
      expect(result[9]).assertEqual('211,97');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0060
     * @tc.name testEmbedQuery0060
     * @tc.desc A differently named replacement cannot supply the requested id: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const substitute = target.cloneNode(false); substitute.id = 'replacementSearch';
          stage.replaceChild(substitute, target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('replacementSearch') === substitute;
          stage.replaceChild(target, substitute);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('83,137');
      expect(result[9]).assertEqual('83,137');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0061
     * @tc.name testEmbedQuery0061
     * @tc.desc Template content is not part of the active document id index: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const template = document.createElement('template'); side.appendChild(template);
          template.content.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = template.content.querySelector('#nativeSearch') === target;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('173,71');
      expect(result[9]).assertEqual('173,71');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0062
     * @tc.name testEmbedQuery0062
     * @tc.desc Template content is not part of the active document id index: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const template = document.createElement('template'); side.appendChild(template);
          template.content.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = template.content.querySelector('#nativeSearch') === target;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('141,57');
      expect(result[9]).assertEqual('141,57');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0063
     * @tc.name testEmbedQuery0063
     * @tc.desc Template content is not part of the active document id index: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const template = document.createElement('template'); side.appendChild(template);
          template.content.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = template.content.querySelector('#nativeSearch') === target;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('211,97');
      expect(result[9]).assertEqual('211,97');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0064
     * @tc.name testEmbedQuery0064
     * @tc.desc Template content is not part of the active document id index: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const template = document.createElement('template'); side.appendChild(template);
          template.content.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = template.content.querySelector('#nativeSearch') === target;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('83,137');
      expect(result[9]).assertEqual('83,137');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0065
     * @tc.name testEmbedQuery0065
     * @tc.desc Detached container retains the child but cannot satisfy the document query: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const detached = document.createElement('div'); detached.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = detached.querySelector('#nativeSearch') === target;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('173,71');
      expect(result[9]).assertEqual('173,71');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0066
     * @tc.name testEmbedQuery0066
     * @tc.desc Detached container retains the child but cannot satisfy the document query: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const detached = document.createElement('div'); detached.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = detached.querySelector('#nativeSearch') === target;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('141,57');
      expect(result[9]).assertEqual('141,57');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0067
     * @tc.name testEmbedQuery0067
     * @tc.desc Detached container retains the child but cannot satisfy the document query: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const detached = document.createElement('div'); detached.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = detached.querySelector('#nativeSearch') === target;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('211,97');
      expect(result[9]).assertEqual('211,97');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0068
     * @tc.name testEmbedQuery0068
     * @tc.desc Detached container retains the child but cannot satisfy the document query: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const detached = document.createElement('div'); detached.appendChild(target);
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = detached.querySelector('#nativeSearch') === target;
          stage.appendChild(target);
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('83,137');
      expect(result[9]).assertEqual('83,137');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0069
     * @tc.name testEmbedQuery0069
     * @tc.desc An adopted node belongs to another document until explicitly adopted back: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const foreign = document.implementation.createHTMLDocument('foreign');
          foreign.body.appendChild(foreign.adoptNode(target));
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = foreign.getElementById('nativeSearch') === target;
          stage.appendChild(document.adoptNode(target));
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('173,71');
      expect(result[9]).assertEqual('173,71');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0070
     * @tc.name testEmbedQuery0070
     * @tc.desc An adopted node belongs to another document until explicitly adopted back: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const foreign = document.implementation.createHTMLDocument('foreign');
          foreign.body.appendChild(foreign.adoptNode(target));
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = foreign.getElementById('nativeSearch') === target;
          stage.appendChild(document.adoptNode(target));
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('141,57');
      expect(result[9]).assertEqual('141,57');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0071
     * @tc.name testEmbedQuery0071
     * @tc.desc An adopted node belongs to another document until explicitly adopted back: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const foreign = document.implementation.createHTMLDocument('foreign');
          foreign.body.appendChild(foreign.adoptNode(target));
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = foreign.getElementById('nativeSearch') === target;
          stage.appendChild(document.adoptNode(target));
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('211,97');
      expect(result[9]).assertEqual('211,97');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0072
     * @tc.name testEmbedQuery0072
     * @tc.desc An adopted node belongs to another document until explicitly adopted back: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const foreign = document.implementation.createHTMLDocument('foreign');
          foreign.body.appendChild(foreign.adoptNode(target));
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = foreign.getElementById('nativeSearch') === target;
          stage.appendChild(document.adoptNode(target));
          const recovered = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          side.appendChild(target); target.style.visibility = 'hidden';
          const moved = getEmbedSize();
          return JSON.stringify([
            String(errorName), String(returned), String(absent), String(absenceEvidence),
            String(recovered.width + ',' + recovered.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(moved.width + ',' + moved.height),
            String(first !== recovered && recovered !== moved),
            String((moved.width - target.clientWidth) + ',' + (moved.height - target.clientHeight))
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
      expect(result[0]).assertEqual('TypeError');
      expect(result[1]).assertEqual('false');
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual(result[4]);
      expect(result[6]).assertEqual('true');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('83,137');
      expect(result[9]).assertEqual('83,137');
      expect(result[10]).assertEqual('true');
      expect(result[11]).assertEqual('0,0');
    });
  });
}
