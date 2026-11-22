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

export default function embedQueryGuard01(host: EmbedDocumentHost): void {
  describe('EmbedQueryGuard01', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_QUERY_0001
     * @tc.name testEmbedQuery0001
     * @tc.desc Renamed id is absent until the exact id is restored: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'removedNativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.id === 'removedNativeSearch';
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
     * @tc.number ARKWEB_EMBED_QUERY_0002
     * @tc.name testEmbedQuery0002
     * @tc.desc Renamed id is absent until the exact id is restored: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'removedNativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.id === 'removedNativeSearch';
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
     * @tc.number ARKWEB_EMBED_QUERY_0003
     * @tc.name testEmbedQuery0003
     * @tc.desc Renamed id is absent until the exact id is restored: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'removedNativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.id === 'removedNativeSearch';
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
     * @tc.number ARKWEB_EMBED_QUERY_0004
     * @tc.name testEmbedQuery0004
     * @tc.desc Renamed id is absent until the exact id is restored: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'removedNativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.id === 'removedNativeSearch';
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
     * @tc.number ARKWEB_EMBED_QUERY_0005
     * @tc.name testEmbedQuery0005
     * @tc.desc All-uppercase id does not satisfy the case-sensitive lookup: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'NATIVESEARCH';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('NATIVESEARCH') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0006
     * @tc.name testEmbedQuery0006
     * @tc.desc All-uppercase id does not satisfy the case-sensitive lookup: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'NATIVESEARCH';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('NATIVESEARCH') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0007
     * @tc.name testEmbedQuery0007
     * @tc.desc All-uppercase id does not satisfy the case-sensitive lookup: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'NATIVESEARCH';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('NATIVESEARCH') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0008
     * @tc.name testEmbedQuery0008
     * @tc.desc All-uppercase id does not satisfy the case-sensitive lookup: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'NATIVESEARCH';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('NATIVESEARCH') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0009
     * @tc.name testEmbedQuery0009
     * @tc.desc All-lowercase id does not alias the original mixed-case id: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'nativesearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('nativesearch') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0010
     * @tc.name testEmbedQuery0010
     * @tc.desc All-lowercase id does not alias the original mixed-case id: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
