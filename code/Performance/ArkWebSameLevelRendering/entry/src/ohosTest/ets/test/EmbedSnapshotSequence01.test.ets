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

export default function embedSnapshotSequence01(host: EmbedDocumentHost): void {
  describe('EmbedSnapshotSequence01', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0001
     * @tc.name testEmbedSnapshot0001
     * @tc.desc Width and height transitions do not revise prior size snapshots: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.style.width = '251px';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.height = '149px';
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
      expect(result[0]).assertEqual('251,149');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('251,71');
      expect(result[6]).assertEqual('251,71');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0002
     * @tc.name testEmbedSnapshot0002
     * @tc.desc Width and height transitions do not revise prior size snapshots: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.style.width = '251px';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.height = '149px';
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
      expect(result[0]).assertEqual('273,163');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('273,57');
      expect(result[6]).assertEqual('273,57');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0003
     * @tc.name testEmbedSnapshot0003
     * @tc.desc Width and height transitions do not revise prior size snapshots: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.style.width = '251px';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.height = '149px';
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
      expect(result[0]).assertEqual('251,149');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('251,97');
      expect(result[6]).assertEqual('251,97');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0004
     * @tc.name testEmbedSnapshot0004
     * @tc.desc Width and height transitions do not revise prior size snapshots: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.style.width = '251px';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.height = '149px';
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
      expect(result[0]).assertEqual('251,149');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('251,137');
      expect(result[6]).assertEqual('251,137');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0005
     * @tc.name testEmbedSnapshot0005
     * @tc.desc Replacement and detached predecessor resize keep earlier snapshots independent: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 281px; height: 107px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.cssText = 'display: block; width: 337px; height: 199px; padding: 0; border: 0;';
          candidate.style.height = '173px';
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
      expect(result[0]).assertEqual('281,173');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('281,107');
      expect(result[6]).assertEqual('281,107');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0006
     * @tc.name testEmbedSnapshot0006
     * @tc.desc Replacement and detached predecessor resize keep earlier snapshots independent: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 281px; height: 107px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.cssText = 'display: block; width: 337px; height: 199px; padding: 0; border: 0;';
          candidate.style.height = '173px';
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
      expect(result[0]).assertEqual('281,173');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('281,107');
      expect(result[6]).assertEqual('281,107');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0007
     * @tc.name testEmbedSnapshot0007
     * @tc.desc Replacement and detached predecessor resize keep earlier snapshots independent: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 281px; height: 107px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.cssText = 'display: block; width: 337px; height: 199px; padding: 0; border: 0;';
          candidate.style.height = '173px';
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
      expect(result[0]).assertEqual('281,173');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('281,107');
      expect(result[6]).assertEqual('281,107');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0008
     * @tc.name testEmbedSnapshot0008
     * @tc.desc Replacement and detached predecessor resize keep earlier snapshots independent: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 281px; height: 107px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.cssText = 'display: block; width: 337px; height: 199px; padding: 0; border: 0;';
          candidate.style.height = '173px';
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
      expect(result[0]).assertEqual('281,173');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('281,107');
      expect(result[6]).assertEqual('281,107');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0009
     * @tc.name testEmbedSnapshot0009
     * @tc.desc Display removal and reappearance preserve the visible and zero-size snapshots: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.display = 'block';
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
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0010
     * @tc.name testEmbedSnapshot0010
     * @tc.desc Display removal and reappearance preserve the visible and zero-size snapshots: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.display = 'block';
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
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0011
     * @tc.name testEmbedSnapshot0011
     * @tc.desc Display removal and reappearance preserve the visible and zero-size snapshots: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.display = 'block';
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
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0012
     * @tc.name testEmbedSnapshot0012
     * @tc.desc Display removal and reappearance preserve the visible and zero-size snapshots: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.style.display = 'block';
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
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0013
     * @tc.name testEmbedSnapshot0013
     * @tc.desc Hidden ancestor then visible percentage reparenting preserves the zero-size snapshot: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.style.cssText = 'width: 326px; height: 218px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 50%; height: 50%; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('163,109');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0014
     * @tc.name testEmbedSnapshot0014
     * @tc.desc Hidden ancestor then visible percentage reparenting preserves the zero-size snapshot: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.style.cssText = 'width: 326px; height: 218px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 50%; height: 50%; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('163,109');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0015
     * @tc.name testEmbedSnapshot0015
     * @tc.desc Hidden ancestor then visible percentage reparenting preserves the zero-size snapshot: live border-box
     * span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.style.cssText = 'width: 326px; height: 218px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 50%; height: 50%; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('163,109');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0016
     * @tc.name testEmbedSnapshot0016
     * @tc.desc Hidden ancestor then visible percentage reparenting preserves the zero-size snapshot: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.style.cssText = 'width: 326px; height: 218px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 50%; height: 50%; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('163,109');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0017
     * @tc.name testEmbedSnapshot0017
     * @tc.desc Visibility-hidden snapshot survives relocation into a display-none ancestor: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.visibility = 'hidden';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(target); side.style.display = 'none';
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
      expect(result[0]).assertEqual('0,0');
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
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0018
     * @tc.name testEmbedSnapshot0018
     * @tc.desc Visibility-hidden snapshot survives relocation into a display-none ancestor: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.visibility = 'hidden';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(target); side.style.display = 'none';
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
      expect(result[0]).assertEqual('0,0');
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
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0019
     * @tc.name testEmbedSnapshot0019
     * @tc.desc Visibility-hidden snapshot survives relocation into a display-none ancestor: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.visibility = 'hidden';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(target); side.style.display = 'none';
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
      expect(result[0]).assertEqual('0,0');
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
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0020
     * @tc.name testEmbedSnapshot0020
     * @tc.desc Visibility-hidden snapshot survives relocation into a display-none ancestor: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.visibility = 'hidden';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(target); side.style.display = 'none';
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
      expect(result[0]).assertEqual('0,0');
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
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0021
     * @tc.name testEmbedSnapshot0021
     * @tc.desc Ancestor movement then same-id replacement leave the moved snapshot intact: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.position = 'relative'; stage.style.left = '37px';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const candidate = document.createElement('span'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 197px; height: 113px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.remove();
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
      expect(result[0]).assertEqual('197,113');
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
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0022
     * @tc.name testEmbedSnapshot0022
     * @tc.desc Ancestor movement then same-id replacement leave the moved snapshot intact: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.position = 'relative'; stage.style.left = '37px';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const candidate = document.createElement('span'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 197px; height: 113px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.remove();
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
      expect(result[0]).assertEqual('197,113');
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
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0023
     * @tc.name testEmbedSnapshot0023
     * @tc.desc Ancestor movement then same-id replacement leave the moved snapshot intact: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.position = 'relative'; stage.style.left = '37px';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const candidate = document.createElement('span'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 197px; height: 113px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.remove();
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
      expect(result[0]).assertEqual('197,113');
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
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0024
     * @tc.name testEmbedSnapshot0024
     * @tc.desc Ancestor movement then same-id replacement leave the moved snapshot intact: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.position = 'relative'; stage.style.left = '37px';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const candidate = document.createElement('span'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 197px; height: 113px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.remove();
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
      expect(result[0]).assertEqual('197,113');
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
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0025
     * @tc.name testEmbedSnapshot0025
     * @tc.desc Successive div and span replacements retain all three independent snapshots: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 233px; height: 91px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const successor = document.createElement('span'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 163px; height: 153px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
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
      expect(result[0]).assertEqual('163,153');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('233,91');
      expect(result[6]).assertEqual('233,91');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0026
     * @tc.name testEmbedSnapshot0026
     * @tc.desc Successive div and span replacements retain all three independent snapshots: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 233px; height: 91px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const successor = document.createElement('span'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 163px; height: 153px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
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
      expect(result[0]).assertEqual('163,153');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('233,91');
      expect(result[6]).assertEqual('233,91');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0027
     * @tc.name testEmbedSnapshot0027
     * @tc.desc Successive div and span replacements retain all three independent snapshots: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 233px; height: 91px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const successor = document.createElement('span'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 163px; height: 153px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
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
      expect(result[0]).assertEqual('163,153');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('233,91');
      expect(result[6]).assertEqual('233,91');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0028
     * @tc.name testEmbedSnapshot0028
     * @tc.desc Successive div and span replacements retain all three independent snapshots: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 233px; height: 91px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const successor = document.createElement('span'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 163px; height: 153px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
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
      expect(result[0]).assertEqual('163,153');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('233,91');
      expect(result[6]).assertEqual('233,91');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0029
     * @tc.name testEmbedSnapshot0029
     * @tc.desc Restoring the id on a later predecessor leaves the alternate-owner snapshot intact: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'retired';
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 269px; height: 67px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.id = 'nativeSearch'; side.appendChild(target);
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
      expect(result[0]).assertEqual('269,67');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('269,67');
      expect(result[6]).assertEqual('269,67');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0030
     * @tc.name testEmbedSnapshot0030
     * @tc.desc Restoring the id on a later predecessor leaves the alternate-owner snapshot intact: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'retired';
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 269px; height: 67px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.id = 'nativeSearch'; side.appendChild(target);
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
      expect(result[0]).assertEqual('269,67');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('269,67');
      expect(result[6]).assertEqual('269,67');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0031
     * @tc.name testEmbedSnapshot0031
     * @tc.desc Restoring the id on a later predecessor leaves the alternate-owner snapshot intact: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'retired';
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 269px; height: 67px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.id = 'nativeSearch'; side.appendChild(target);
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
      expect(result[0]).assertEqual('269,67');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('269,67');
      expect(result[6]).assertEqual('269,67');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0032
     * @tc.name testEmbedSnapshot0032
     * @tc.desc Restoring the id on a later predecessor leaves the alternate-owner snapshot intact: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'retired';
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 269px; height: 67px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.id = 'nativeSearch'; side.appendChild(target);
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
      expect(result[0]).assertEqual('269,67');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('269,67');
      expect(result[6]).assertEqual('269,67');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0033
     * @tc.name testEmbedSnapshot0033
     * @tc.desc Detached predecessor reinsertion into a percentage box preserves the successor snapshot: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 179px; height: 139px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.style.cssText = 'width: 278px; height: 182px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 50%; height: 50%; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('139,91');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('179,139');
      expect(result[6]).assertEqual('179,139');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0034
     * @tc.name testEmbedSnapshot0034
     * @tc.desc Detached predecessor reinsertion into a percentage box preserves the successor snapshot: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 179px; height: 139px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.style.cssText = 'width: 278px; height: 182px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 50%; height: 50%; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('139,91');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('179,139');
      expect(result[6]).assertEqual('179,139');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0035
     * @tc.name testEmbedSnapshot0035
     * @tc.desc Detached predecessor reinsertion into a percentage box preserves the successor snapshot: live
     * border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 179px; height: 139px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.style.cssText = 'width: 278px; height: 182px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 50%; height: 50%; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('139,91');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('179,139');
      expect(result[6]).assertEqual('179,139');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0036
     * @tc.name testEmbedSnapshot0036
     * @tc.desc Detached predecessor reinsertion into a percentage box preserves the successor snapshot: live
     * replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 179px; height: 139px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.style.cssText = 'width: 278px; height: 182px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 50%; height: 50%; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('139,91');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('179,139');
      expect(result[6]).assertEqual('179,139');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0037
     * @tc.name testEmbedSnapshot0037
     * @tc.desc Earlier duplicate movement and predecessor id retirement preserve its measured snapshot: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 307px; height: 73px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(candidate); target.id = 'retiredPredecessor';
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
      expect(result[0]).assertEqual('307,73');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('307,73');
      expect(result[6]).assertEqual('307,73');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0038
     * @tc.name testEmbedSnapshot0038
     * @tc.desc Earlier duplicate movement and predecessor id retirement preserve its measured snapshot: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 307px; height: 73px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(candidate); target.id = 'retiredPredecessor';
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
      expect(result[0]).assertEqual('307,73');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('307,73');
      expect(result[6]).assertEqual('307,73');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0039
     * @tc.name testEmbedSnapshot0039
     * @tc.desc Earlier duplicate movement and predecessor id retirement preserve its measured snapshot: live
     * border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 307px; height: 73px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(candidate); target.id = 'retiredPredecessor';
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
      expect(result[0]).assertEqual('307,73');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('307,73');
      expect(result[6]).assertEqual('307,73');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0040
     * @tc.name testEmbedSnapshot0040
     * @tc.desc Earlier duplicate movement and predecessor id retirement preserve its measured snapshot: live
     * replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 307px; height: 73px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.appendChild(candidate); target.id = 'retiredPredecessor';
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
      expect(result[0]).assertEqual('307,73');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('307,73');
      expect(result[6]).assertEqual('307,73');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });
  });
}
