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
     * @tc.number ARKWEB_EMBED_QUERY_0011
     * @tc.name testEmbedQuery0011
     * @tc.desc All-lowercase id does not alias the original mixed-case id: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.number ARKWEB_EMBED_QUERY_0012
     * @tc.name testEmbedQuery0012
     * @tc.desc All-lowercase id does not alias the original mixed-case id: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.number ARKWEB_EMBED_QUERY_0013
     * @tc.name testEmbedQuery0013
     * @tc.desc Uppercase initial letter is a different id: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'NativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('NativeSearch') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0014
     * @tc.name testEmbedQuery0014
     * @tc.desc Uppercase initial letter is a different id: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'NativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('NativeSearch') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0015
     * @tc.name testEmbedQuery0015
     * @tc.desc Uppercase initial letter is a different id: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'NativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('NativeSearch') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0016
     * @tc.name testEmbedQuery0016
     * @tc.desc Uppercase initial letter is a different id: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'NativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('NativeSearch') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0017
     * @tc.name testEmbedQuery0017
     * @tc.desc Trailing-space id is not trimmed by the business lookup: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'nativeSearch ';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('nativeSearch ') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0018
     * @tc.name testEmbedQuery0018
     * @tc.desc Trailing-space id is not trimmed by the business lookup: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'nativeSearch ';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('nativeSearch ') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0019
     * @tc.name testEmbedQuery0019
     * @tc.desc Trailing-space id is not trimmed by the business lookup: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'nativeSearch ';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('nativeSearch ') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0020
     * @tc.name testEmbedQuery0020
     * @tc.desc Trailing-space id is not trimmed by the business lookup: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'nativeSearch ';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById('nativeSearch ') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0021
     * @tc.name testEmbedQuery0021
     * @tc.desc Leading-space id is not normalized by the business lookup: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = ' nativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById(' nativeSearch') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0022
     * @tc.name testEmbedQuery0022
     * @tc.desc Leading-space id is not normalized by the business lookup: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = ' nativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById(' nativeSearch') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0023
     * @tc.name testEmbedQuery0023
     * @tc.desc Leading-space id is not normalized by the business lookup: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = ' nativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById(' nativeSearch') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0024
     * @tc.name testEmbedQuery0024
     * @tc.desc Leading-space id is not normalized by the business lookup: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = ' nativeSearch';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementById(' nativeSearch') === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0025
     * @tc.name testEmbedQuery0025
     * @tc.desc Removing the id attribute causes TypeError rather than a cached fallback: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = !target.hasAttribute('id');
          target.setAttribute('id', 'nativeSearch');
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
     * @tc.number ARKWEB_EMBED_QUERY_0026
     * @tc.name testEmbedQuery0026
     * @tc.desc Removing the id attribute causes TypeError rather than a cached fallback: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = !target.hasAttribute('id');
          target.setAttribute('id', 'nativeSearch');
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
     * @tc.number ARKWEB_EMBED_QUERY_0027
     * @tc.name testEmbedQuery0027
     * @tc.desc Removing the id attribute causes TypeError rather than a cached fallback: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = !target.hasAttribute('id');
          target.setAttribute('id', 'nativeSearch');
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
     * @tc.number ARKWEB_EMBED_QUERY_0028
     * @tc.name testEmbedQuery0028
     * @tc.desc Removing the id attribute causes TypeError rather than a cached fallback: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = !target.hasAttribute('id');
          target.setAttribute('id', 'nativeSearch');
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
     * @tc.number ARKWEB_EMBED_QUERY_0029
     * @tc.name testEmbedQuery0029
     * @tc.desc An empty id does not select the cached node: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = '';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.getAttribute('id') === '';
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
     * @tc.number ARKWEB_EMBED_QUERY_0030
     * @tc.name testEmbedQuery0030
     * @tc.desc An empty id does not select the cached node: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = '';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.getAttribute('id') === '';
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
     * @tc.number ARKWEB_EMBED_QUERY_0031
     * @tc.name testEmbedQuery0031
     * @tc.desc An empty id does not select the cached node: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = '';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.getAttribute('id') === '';
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
     * @tc.number ARKWEB_EMBED_QUERY_0032
     * @tc.name testEmbedQuery0032
     * @tc.desc An empty id does not select the cached node: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = '';
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = target.getAttribute('id') === '';
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
     * @tc.number ARKWEB_EMBED_QUERY_0033
     * @tc.name testEmbedQuery0033
     * @tc.desc A matching name attribute is not a matching id: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        const savedExtra = original.getAttribute('name');
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          target.removeAttribute('id'); target.setAttribute('name', 'nativeSearch');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementsByName('nativeSearch')[0] === target;
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
          if (savedExtra === null) { original.removeAttribute('name'); }
          else { original.setAttribute('name', savedExtra); }
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
     * @tc.number ARKWEB_EMBED_QUERY_0034
     * @tc.name testEmbedQuery0034
     * @tc.desc A matching name attribute is not a matching id: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id'); target.setAttribute('name', 'nativeSearch');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementsByName('nativeSearch')[0] === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0035
     * @tc.name testEmbedQuery0035
     * @tc.desc A matching name attribute is not a matching id: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id'); target.setAttribute('name', 'nativeSearch');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementsByName('nativeSearch')[0] === target;
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
     * @tc.number ARKWEB_EMBED_QUERY_0036
     * @tc.name testEmbedQuery0036
     * @tc.desc A matching name attribute is not a matching id: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedQuery0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.removeAttribute('id'); target.setAttribute('name', 'nativeSearch');
          let errorName = ''; let returned = false;
          try { getEmbedSize(); returned = true; } catch (error) { errorName = error.name; }
          const absent = document.getElementById('nativeSearch') === null;
          const absenceEvidence = document.getElementsByName('nativeSearch')[0] === target;
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
  });
}
